+++
draft = false
date = 2026-02-05T13:30:00+08:00
title = "ComfyUI 自动化调用完全指南：从本地到云端，从手动到智能"
description = "深度解析 ComfyUI 的 API 架构，提供完整的自动化调用方案、参数调整、输出获取代码示例。解决 JSON 参数手动调整的痛点。"
slug = "2026-02-05-comfyui-automation-complete-guide"
authors = ["马达法卡"]
tags = ["ComfyUI", "Stable Diffusion", "工作流自动化", "API", "WebSocket", "Python"]
categories = ["技术分享"]
+++

# ComfyUI 自动化调用完全指南：从本地到云端，从手动到智能

> 你有很多 ComfyUI 工作流 JSON 文件，很多地方都要手动调整参数？每次生成都要手动点"执行"？这篇指南将带你从手动操作走向完全自动化。

---

## 问题：手动操作的痛点

你是不是遇到过这些情况？

1. 🔧 **每次生成都要手动调整参数**
   - 提示词、步数、CFG scale、采样器
   - Seed 每次要变
   - 分辨率宽高需要单独设置

2. 📂 **多个工作流文件管理混乱**
   - `workflow.json`，`workflow_v2.json`，`workflow_final.json`
   - 哪个是最新版本？哪个在用？

3. 📸 **生成的文件找不到**
   - 输出到 `ComfyUI/output`
   - 文件名是时间戳，不知道哪个是刚生成的
   - 想要自动下载到本地或云端

4. 🤖 **想批量生成变体**
   - 同样的工作流，不同参数
   - 需要手动执行 10 次以上

---

## 核心问题：ComfyUI 有 API 吗？

### ❌ 常见的误解

很多人以为 ComfyUI 像其他 AI 服务一样有 REST API：
```bash
curl -X POST http://localhost:8188/api/generate \
  -H "Content-Type: application/json" \
  -d '{"prompt": "a beautiful city"}'
```

**但这不存在！**

### ✅ 真实的情况

ComfyUI 的本地 API **不是标准的 HTTP REST API**，而是：

```
用户界面 (JS/Frontend) 
  ↓ WebSocket
  ↓ 
Python 后端 (自定义协议)
  ↓ 
Stable Diffusion / 其他模型
```

**关键点：**
- 🌐 **通信协议**：WebSocket (`ws://127.0.0.1:8188`)
- 📦 **消息格式**：JSON（但不是标准的 REST 格式）
- 🔐 **客户端 ID**：每个连接需要唯一的 `clientId`
- 🔑 **协议是自定义的**：需要理解 ComfyUI 的内部消息类型

### 💡 云端 API（Comfy Cloud）

ComfyUI 有官方的云 API，用于在云端运行工作流：
- **文档**: https://docs.comfy.org/cloud-api
- **用途**：调用付费模型、云端生成
- **局限性**：功能可能不如本地完整版

**结论**：如果你想要完全自动化控制，**应该使用本地 WebSocket + Python 集成**。

---

## 第一部分：通过 WebSocket 控制工作流

### 基础连接示例

```python
import asyncio
import websockets
import json

class ComfyUIController:
    def __init__(self, host="127.0.0.1", port=8188):
        self.host = host
        self.port = port
        self.ws = None
        self.client_id = str(id(self))
    
    async def connect(self):
        uri = f"ws://{self.host}:{self.port}/ws?clientId={self.client_id}"
        self.ws = await websockets.connect(uri)
        print(f"✅ 已连接到 ComfyUI (127.0.0.1:8188)")
    
    async def load_workflow(self, workflow_json_path):
        """加载工作流 JSON 文件"""
        with open(workflow_json_path, 'r', encoding='utf-8') as f:
            workflow = json.load(f)
        
        # 发送加载工作流的消息
        message = {
            "type": "load_workflow",
            "data": workflow
        }
        await self.ws.send(json.dumps(message))
        print(f"✅ 已加载工作流: {workflow.get('3', {}).get('name', 'Unknown')}")
    
    async def execute_workflow(self, prompt_text, **kwargs):
        """修改提示词并执行"""
        message = {
            "type": "execute_workflow",
            "data": {
                "prompt": prompt_text,
                "extra_args": kwargs
            }
        }
        await self.ws.send(json.dumps(message))
        print(f"✅ 已发送执行命令: {prompt_text[:50]}...")
    
    async def close(self):
        if self.ws:
            await self.ws.close()

# 使用示例
async def main():
    controller = ComfyUIController()
    await controller.connect()
    
    # 加载你的工作流
    await controller.load_workflow("/path/to/your/workflow.json")
    
    # 修改参数并执行
    await controller.execute_workflow(
        prompt="一个赛博朋克的城市",
        steps=20,
        cfg_scale=7.0,
        seed=123456
    )
    
    await controller.close()

if __name__ == "__main__":
    asyncio.run(main())
```

### 执行队列系统

如果你不想使用 WebSocket 协议，可以直接使用 Python API：

```python
import execution
import folder_paths

# 加载工作流
def load_workflow_api(api, prompt):
    """将 API 格式转换为内部格式"""
    workflow = api.deserialize(prompt)
    return workflow

# 自定义执行逻辑
def run_custom_workflow(prompt_text, **parameters):
    """自定义执行完整工作流"""
    # 1. 初始化服务器
    api = execution.PromptServer(None)
    api.init_external_custom_nodes()
    
    # 2. 创建提示
    p = {}
    p["prompt"] = prompt_text
    p.update(parameters)
    
    # 3. 执行工作流
    workflow = load_workflow_api(api, p)
    
    # 4. 添加到队列
    server = api.server
    server_id = str(id(server))
    
    execution.add_queue_item(
        {"prompt": p, "client_id": server_id, "extra_data": {}}
    )
    
    # 5. 执行
    e = execution.execute(server, p)
    
    # 6. 获取输出
    output_data = e.get_output_data(0, 0)
    
    return {
        "status": "success",
        "output": output_data,
        "images": output_data.get("images", [])
    }

# 使用示例
result = run_custom_workflow(
    prompt_text="一个赛博朋克的城市",
    steps=20,
    cfg_scale=7.0,
    sampler_name="euler_a",
    seed=123456
)

print(f"✅ 生成完成！")
print(f"📸 图片数量: {len(result['output']['images'])}")
```

---

## 第二部分：获取生成的文件

### 方法 1：获取输出目录

ComfyUI 的输出文件通常保存在以下位置：

| 操作系统 | 默认路径 |
|---------|---------|
| Windows | `%USERPROFILE%\ComfyUI\output` |
| macOS/Linux | `~/ComfyUI/output` |

```python
import execution
import folder_paths

# 获取输出目录
output_dir = folder_paths.get_output_directory()
print(f"输出目录: {output_dir}")
```

### 方法 2：扫描最新文件

```python
import os
from datetime import datetime

def get_latest_output_files(directory, count=5):
    """获取最新的输出文件（按修改时间排序）"""
    files = []
    
    # 获取所有图片文件
    for ext in ['*.png', '*.jpg', '*.webp']:
        files.extend(glob.glob(os.path.join(directory, ext)))
    
    # 按修改时间排序（最新的在前）
    files.sort(key=lambda x: os.path.getmtime(x), reverse=True)
    
    return files[:count]

# 使用
output_dir = folder_paths.get_output_directory()
latest_files = get_latest_output_files(output_dir)

print(f"📸 最新的 {len(latest_files)} 个输出文件:")
for i, file in enumerate(latest_files):
    mtime = datetime.fromtimestamp(os.path.getmtime(file))
    print(f"{i+1}. {os.path.basename(file)} - {mtime.strftime('%Y-%m-%d %H:%M:%S')}")
```

---

## 第三部分：自动化参数调整

### 方案 1：使用 Jinja2 模板

```python
from jinja2 import Template
import json

# 定义工作流模板
workflow_template = """
{
  "3": {
    "inputs": {
      "ckpt_name": ["{{ model }}"],
      "vae_name": ["{{ vae }}"],
      "text": ["{{ prompt }}"],
      "steps": {{ steps }},
      "cfg_scale": {{ cfg_scale }},
      "seed": {{ seed }},
      "sampler_name": "{{ sampler_name }}"
    }
  }
}
"""

# 创建模板引擎
template = Template(workflow_template)

def generate_workflow(params):
    """根据参数生成工作流 JSON"""
    workflow = template.render(
        model=params.get('model', 'sd_xl_base.safetensors'),
        vae=params.get('vae', 'sdxl_vae.safetensors'),
        prompt=params.get('prompt', 'A beautiful sunset'),
        steps=params.get('steps', 20),
        cfg_scale=params.get('cfg_scale', 7.0),
        seed=params.get('seed', -1),  # -1 表示随机
        sampler_name=params.get('sampler', 'euler_a')
    )
    
    return json.loads(workflow)

# 生成工作流
params = {
    'prompt': '一个赛博朋克的城市，霓虹灯闪烁，高楼林立',
    'model': 'cyberpunk_v2.safetensors',
    'steps': 30,
    'cfg_scale': 8.0,
    'seed': 42
}

workflow = generate_workflow(params)

# 保存为 JSON
with open('/Users/jojo/comfyui/workflows/cyberpunk.json', 'w') as f:
    json.dump(workflow, f, indent=2)

print(f"✅ 工作流已生成: cyberpunk.json")
```

### 方案 2：修改现有工作流

```python
import json

def modify_workflow_json(input_path, output_path, modifications):
    """修改工作流 JSON 中的参数"""
    with open(input_path, 'r') as f:
        workflow = json.load(f)
    
    # 应用修改
    if '3' in workflow and 'inputs' in workflow['3']:
        workflow['3']['inputs']['text'][0] = modifications.get('prompt', '')
    
    if '3' in workflow and 'inputs' in workflow['3']:
        if 'steps' in workflow['3']['inputs']:
            workflow['3']['inputs']['steps'] = modifications.get('steps', 20)
    
    # 保存修改后的工作流
    with open(output_path, 'w') as f:
        json.dump(workflow, f, indent=2)
    
    print(f"✅ 工作流已修改并保存到: {output_path}")

# 使用示例
modifications = {
    'prompt': '一个未来主义的火星殖民地',
    'steps': 25,
    'cfg_scale': 7.5,
    'seed': 999
}

modify_workflow_json(
    '/Users/jojo/comfyui/workflows/base.json',
    '/Users/jojo/comfyui/workflows/mars_colony.json',
    modifications
)
```

---

## 第四部分：完整的自动化示例

### 完整的自动化控制器

```python
#!/usr/bin/env python3
"""
ComfyUI 自动化工作流执行器
"""

import asyncio
import websockets
import json
import os
from datetime import datetime

class ComfyUIAutomator:
    def __init__(self, host="127.0.0.1", port=8188):
        self.host = host
        self.port = port
        self.ws = None
        self.client_id = f"automator_{datetime.now().strftime('%Y%m%d%H%M%S')}"
    
    async def connect(self):
        uri = f"ws://{self.host}:{self.port}/ws?clientId={self.client_id}"
        self.ws = await websockets.connect(uri)
        print(f"✅ 已连接到 ComfyUI (127.0.0.1:8188)")
    
    async def load_and_execute_workflow(self, workflow_path, prompt_modifications=None):
        """加载并执行工作流"""
        # 1. 加载工作流 JSON
        with open(workflow_path, 'r') as f:
            workflow = json.load(f)
        
        # 2. 修改参数（如果需要）
        if prompt_modifications:
            for key, value in prompt_modifications.items():
                if '3' in workflow and 'inputs' in workflow['3']:
                    if key in workflow['3']['inputs']:
                        workflow['3']['inputs'][key] = value
        
        # 3. 发送加载命令
        load_message = {
            "type": "load_workflow",
            "data": workflow
        }
        await self.ws.send(json.dumps(load_message))
        
        # 4. 等待加载
        await asyncio.sleep(1)
        
        # 5. 执行工作流
        execute_message = {
            "type": "execute_workflow",
            "data": {}  # 使用工作流中的默认参数
        }
        await self.ws.send(json.dumps(execute_message))
        
        print(f"✅ 工作流已执行: {workflow.get('3', {}).get('inputs', {}).get('text', ['Unknown'])[0][:50]}...")
        
        # 6. 等待执行完成（根据步数估算）
        steps = 20
        await asyncio.sleep(steps * 0.5)
    
    async def get_latest_outputs(self, count=5):
        """获取最新的输出文件"""
        output_dir = os.path.expanduser("~/ComfyUI/output")
        
        if not os.path.exists(output_dir):
            print(f"❌ 输出目录不存在: {output_dir}")
            return []
        
        # 获取所有图片文件
        image_files = []
        for ext in ['*.png', '*.jpg', '*.webp']:
            image_files.extend(glob.glob(os.path.join(output_dir, ext)))
        
        # 按修改时间排序
        image_files.sort(key=lambda x: os.path.getmtime(x), reverse=True)
        
        return image_files[:count]
    
    async def close(self):
        if self.ws:
            await self.ws.close()
            print(f"🔌 已断开连接")

# 使用示例
async def main():
    automator = ComfyUIAutomator()
    
    # 1. 连接到 ComfyUI
    await automator.connect()
    
    # 2. 加载并执行工作流
    workflow_path = "/Users/jojo/comfyui/workflows/cyberpunk.json"
    
    prompt_modifications = {
        'prompt': ['一个雨夜的赛博朋克城市，霓虹灯在水洼中倒映，雨水打在合成皮肤上'],
        'steps': 30,  # 更多细节
        'cfg_scale': 8.0,  # 更强的色彩
        'seed': 123456  # 可复现
    }
    
    await automator.load_and_execute_workflow(workflow_path, prompt_modifications)
    
    # 3. 获取最新的输出文件
    latest_files = await automator.get_latest_outputs(count=3)
    
    print(f"\n📸 最新的 {len(latest_files)} 个输出文件:")
    for file in latest_files:
        mtime = datetime.fromtimestamp(os.path.getmtime(file))
        print(f"  - {os.path.basename(file)} ({mtime.strftime('%Y-%m-%d %H:%M:%S')})")
    
    # 4. 断开连接
    await automator.close()

if __name__ == "__main__":
    asyncio.run(main())
```

---

## 第五部分：批量生成变体

### 批量生成多个版本

```python
import asyncio
from itertools import product

async def batch_generate(controller, prompts, configs):
    """批量生成多个版本"""
    tasks = []
    
    for prompt in prompts:
        for config in configs:
            tasks.append(controller.execute_workflow(prompt, **config))
    
    # 并发执行
    results = await asyncio.gather(*tasks)
    
    # 统计结果
    total_images = sum(len(r.get('output', {}).get('images', [])) for r in results)
    print(f"✅ 批量生成完成：总共 {total_images} 张图片")
    
    return results

# 使用示例
prompts = [
    "赛博朋克城市（日间）",
    "赛博朋克城市（夜间）",
    "赛博朋克城市（雨天）"
]

configs = [
    {'steps': 20, 'cfg_scale': 7.0},
    {'steps': 30, 'cfg_scale': 8.0},
    {'steps': 25, 'cfg_scale': 7.5}
]

# controller = ComfyUIAutomator()
# await controller.connect()
# results = await batch_generate(controller, prompts, configs)
```

---

## 第六部分：高级技巧

### 1. 实时监控输出目录

```python
import os
from watchdog.observers import Observer
from watchdog.events import FileSystemEventHandler

class OutputFileHandler(FileSystemEventHandler):
    def on_created(self, event):
        print(f"🆕 新文件创建: {event.src_path}")
        self.process_file(event)
    
    def on_modified(self, event):
        print(f"📝 文件已更新: {event.src_path}")
        self.process_file(event)
    
    def process_file(self, event):
        # 在这里添加自动处理逻辑
        # 例如：重命名、移动、上传到云端等
        pass

def watch_output_directory(directory):
    """实时监控输出目录"""
    event_handler = OutputFileHandler()
    observer = Observer()
    observer.schedule(event_handler, directory, recursive=False)
    
    observer.start()
    print(f"👀 开始监控输出目录: {directory}")
    
    return observer

# 使用
observer = watch_output_directory("~/ComfyUI/output")
# observer.join()  # 主程序结束时停止
```

### 2. 性能优化建议

```python
# 设置合理的默认值
DEFAULT_CONFIG = {
    'steps': 20,
    'cfg_scale': 7.0,
    'sampler_name': 'euler_a',
    'width': 512,
    'height': 512
}

# 避免使用过高的参数
# - steps > 50 会显著增加生成时间
# - cfg_scale > 12 可能导致图像过饱和
# - seed = -1 每次随机生成新图像

# 测试不同参数组合
TEST_CONFIGS = [
    {'steps': 20, 'cfg_scale': 7.0},
    {'steps': 30, 'cfg_scale': 8.0},
    {'steps': 40, 'cfg_scale': 9.0}
]
```

### 3. 错误处理和日志

```python
import logging
from datetime import datetime

# 配置日志
logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.FileHandler('comfyui_automation.log'),
        logging.StreamHandler()
    ]
)

def log_execution(workflow_path, params, status):
    """记录详细的执行日志"""
    log_entry = {
        'timestamp': datetime.now().isoformat(),
        'workflow': workflow_path,
        'params': params,
        'status': status
    }
    
    with open('execution_log.json', 'a') as f:
        json.dump(log_entry, f, indent=2)
    
    logging.info(f"执行完成: {status}")

# 使用
try:
    result = run_custom_workflow(
        prompt_text="一个未来主义的火星殖民地",
        steps=25,
        cfg_scale=7.5,
        seed=42
    )
    log_execution("/path/to/workflow.json", {"steps": 25}, "success")
except Exception as e:
    logging.error(f"执行失败: {str(e)}")
```

---

## 第七部分：推荐的工具和资源

### 工作流管理工具

- **ComfyUI-Custom-Scripts**: https://github.com/pythongosssssgg/ComfyUI-Custom-Scripts
  - 提供工作流管理和自动化脚本

- **ComfyUI Workflow Manager**: 可以批量管理参数

### JSON 编辑工具

- **VS Code + ComfyUI 插件**: 语法高亮、自动补全
- **ComfyUI-Web**: 可视化编辑工作流

### 社区资源

- **ComfyUI Reddit**: https://reddit.com/r/ComfyUI/
- **ComfyUI Discord**: 实时讨论和帮助

---

## 第八部分：从手动到自动化的跨越

### 第一阶段：手动操作

你现在的状态：
- ❌ 每次生成手动调整参数
- ❌ 手动点击"执行"
- ❌ 手动下载输出文件

### 第二阶段：基础自动化

使用本文的代码实现：
- ✅ 通过 Python 加载工作流
- ✅ 自动调整参数
- ✅ 执行工作流
- ✅ 获取最新输出文件

### 第三阶段：完全自动化

实现：
- ✅ 实时监控输出目录
- ✅ 批量生成多个版本
- ✅ 自动下载和处理文件
- ✅ 生成日志和统计

---

## 总结：你需要做的

### 立即可以做的

1. ✅ **复制 WebSocket 连接代码**
2. ✅ **创建你的工作流模板**
3. ✅ **测试基本的工作流执行**
4. ✅ **实现文件监控**

### 进阶功能

1. ✅ **批量生成系统**
2. ✅ **参数调优工具**
3. ✅ **自动云端备份**
4. ✅ **Web 界面集成**

### 终极目标

- 🤖 **一套命令生成 10 个变体**
- 📊 **自动收集所有生成的文件**
- 📈 **不断优化参数组合**
- 🎯 **根据结果自动调整下一步行动**

---

## 结语：从手动到智能

ComfyUI 的本地服务虽然不提供标准的 HTTP REST API，但通过 WebSocket 和 Python 集成，你可以实现：

1. ✅ **完全自动化的工作流控制**
2. ✅ **动态参数调整**
3. ✅ **批量生成和处理**
4. ✅ **实时文件监控**
5. ✅ **版本控制的模板系统**

**关键要点：**
- 理解 WebSocket 通信协议
- 使用 JSON 格式发送命令
- 监控输出目录获取最新文件
- 使用模板系统管理参数

**从手动操作走向自动化，只需要一行代码。**

---

## 参考资源

- ComfyUI 官方文档: https://docs.comfy.org/
- ComfyUI GitHub: https://github.com/comfyanonymous/ComfyUI
- ComfyUI.org: https://www.comfyui.org/

---

*希望这篇指南能帮助你实现 ComfyUI 的完全自动化！*
