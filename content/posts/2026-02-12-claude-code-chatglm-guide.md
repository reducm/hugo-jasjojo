+++
draft = false
date = 2026-02-12T08:15:00+08:00
title = "Claude Code + ChatGLM 完全上手指南：AI 编程助手组合拳"
description = "详细攻略：如何安装配置 Claude Code，购买和接入 ChatGLM API，打造你自己的 AI 编程助手组合"
slug = "2026-02-12-claude-code-chatglm-guide"
authors = ["马达法卡"]
tags = ["Claude", "ChatGLM", "AI编程", "教程", "智谱AI"]
categories = ["AI的感想"]
+++

最近有不少朋友问我如何搭建自己的 AI 编程助手环境。今天写一份详细攻略，介绍 **Claude Code** + **ChatGLM** 的组合方案——前者是 Anthropic 出品的终端 AI 编程助手，后者是国产大模型智谱 AI 的 API 服务，性价比很高。

<!--more-->

## 一、Claude Code 是什么？

[Claude Code](https://github.com/anthropics/claude-code) 是 Anthropic 推出的**终端 AI 编程助手**，可以理解为 Claude 的"命令行版本"。它能：

- 🔍 **理解整个代码库**：自动分析项目结构、依赖关系
- 💻 **直接执行命令**：可以运行 git、npm、测试等命令
- 📝 **代码编辑**：直接修改、创建、删除文件
- 🐛 **Debug 辅助**：分析错误日志，提出修复建议
- 🔄 **Git 工作流**：提交代码、创建分支、查看 diff

简单说，它像一个"驻场在你终端里的资深程序员"。

---

## 二、Claude Code 安装方法

### 方式一：官方推荐安装（Mac/Linux）

```bash
curl -fsSL https://claude.ai/install.sh | bash
```

### 方式二：Homebrew（Mac/Linux）

```bash
brew install --cask claude-code
```

### 方式三：Windows 安装

```powershell
# PowerShell 执行
irm https://claude.ai/install.ps1 | iex
```

或使用 WinGet：

```powershell
winget install Anthropic.ClaudeCode
```

### 方式四：NPM（已弃用，不推荐）

```bash
npm install -g @anthropic-ai/claude-code
```

> ⚠️ **注意**：NPM 安装方式已被官方弃用，建议使用前三种方式。

---

## 三、ChatGLM API 购买与配置

由于 Claude Code 默认使用 Claude 模型（需要 Anthropic 账号和 API Key），但国内访问有一定门槛。一个更经济的替代方案是：**在支持 OpenAI 兼容接口的工具中接入 ChatGLM**。

### 3.1 注册智谱 AI 开放平台

访问：[https://open.bigmodel.cn](https://open.bigmodel.cn)

1. 使用手机号注册账号
2. 完成实名认证（个人开发者即可）
3. 进入控制台获取 API Key

### 3.2 ChatGLM 模型介绍

智谱 AI 目前提供的主要模型：

| 模型 | 特点 | 适用场景 |
|------|------|----------|
| **GLM-4** | 旗舰模型，综合能力最强 | 复杂编程任务、深度分析 |
| **GLM-4-Plus** | 增强版，上下文更长 | 大规模代码库分析 |
| **GLM-4-Air** | 轻量版，速度快 | 日常编程、快速响应 |
| **GLM-4-Flash** | 极速版，成本最低 | 简单任务、批量处理 |

### 3.3 价格参考（2025年最新）

智谱 AI 采用**按量计费**，价格相对实惠：

**GLM-4 系列：**
- GLM-4-Flash：¥0.001 / 1K tokens（约等于免费）
- GLM-4-Air：¥0.003 / 1K tokens
- GLM-4：¥0.01 / 1K tokens
- GLM-4-Plus：¥0.02 / 1K tokens

> 💡 **省钱建议**：日常编程用 GLM-4-Air 或 Flash 就够了，复杂任务再切到 GLM-4。

### 3.3 获取 API Key

1. 登录 [open.bigmodel.cn](https://open.bigmodel.cn)
2. 进入「用户中心」→「API Keys」
3. 点击「创建 API Key」
4. 复制保存（**注意**：Key 只显示一次，请妥善保存）

---

## 四、配置 Claude Code 使用 ChatGLM

### 4.1 直接配置方法

Claude Code 默认不支持直接切换模型，但可以通过环境变量或配置文件调整。

在启动 Claude Code 前，设置环境变量：

```bash
export ANTHROPIC_API_KEY="your-chatglm-api-key"
export ANTHROPIC_BASE_URL="https://open.bigmodel.cn/api/paas/v4"
```

然后启动：

```bash
claude
```

### 4.2 使用 OpenAI 兼容接口

更通用的方案是配合支持 OpenAI 接口的工具使用。ChatGLM 提供 OpenAI 兼容的 API：

```bash
# API Endpoint
https://open.bigmodel.cn/api/paas/v4

# 模型名称示例
glm-4
glm-4-plus
glm-4-air
glm-4-flash
```

### 4.3 配置文件方式

创建或编辑 Claude Code 配置文件：

```bash
# 配置文件位置
~/.config/claude/config.json
```

添加自定义 provider：

```json
{
  "providers": {
    "chatglm": {
      "api_key": "your-chatglm-api-key",
      "base_url": "https://open.bigmodel.cn/api/paas/v4",
      "model": "glm-4"
    }
  }
}
```

---

## 五、实战使用技巧

### 5.1 启动 Claude Code

```bash
# 进入你的项目目录
cd /path/to/your/project

# 启动 Claude Code
claude
```

### 5.2 常用命令

| 命令 | 作用 |
|------|------|
| `/help` | 查看帮助 |
| `/exit` 或 `Ctrl+D` | 退出 |
| `/bug` | 报告 bug |
| `/clear` | 清空对话历史 |
| `/compact` | 压缩对话上下文 |

### 5.3 使用示例

**让 Claude Code 帮你理解代码：**

```
> 帮我解释一下这个项目的主要结构和入口文件
```

**自动执行 Git 操作：**

```
> 帮我提交刚才的修改，写一个有意义的 commit message
```

**Debug 辅助：**

```
> 运行测试并分析失败的用例
```

**代码重构：**

```
> 把 utils.js 里的重复代码提取成公共函数
```

---

## 六、完整配置方案对比

| 方案 | 优点 | 缺点 | 费用 |
|------|------|------|------|
| Claude Code + Claude API | 原生支持，体验最佳 | 需要海外支付方式 | $20+/月 |
| Claude Code + ChatGLM | 性价比高，国内可用 | 需要额外配置 | ¥10-50/月 |
| OpenCode + ChatGLM | 完全开源免费 | 功能相对简单 | 免费 |
| Continue + ChatGLM | VS Code 集成好 | 不是终端工具 | 免费 |

---

## 七、推荐配置

对于国内用户，我建议这样配置：

1. **主力方案**：Claude Code + GLM-4-Air
   - 日常使用足够，速度快
   - 成本低，¥30-50/月可以重度使用

2. **省钱方案**：Claude Code + GLM-4-Flash
   - 几乎免费（¥0.001/1K tokens）
   - 简单任务完全够用

3. **进阶方案**：Claude Code + GLM-4
   - 复杂项目、深度代码分析时用
   - 需要时再切换

---

## 八、常见问题

**Q: Claude Code 和 Cursor 有什么区别？**
A: Claude Code 是终端工具，Cursor 是 VS Code 分支。Claude Code 更适合在服务器/远程环境使用，Cursor 更适合本地开发。

**Q: ChatGLM 代码能力怎么样？**
A: GLM-4 的代码能力接近 GPT-4，日常编程、Debug、重构都没问题。对于复杂算法可能需要多轮交互。

**Q: 需要翻墙吗？**
A: Claude Code 安装包下载可能需要，但使用 ChatGLM 作为后端则完全不需要。

**Q: 免费额度有多少？**
A: 智谱 AI 新注册用户通常有 ¥10-50 的免费额度，足够体验一段时间。

---

## 九、总结

Claude Code + ChatGLM 是一个**性价比极高的 AI 编程组合**：

- ✅ Claude Code 提供优秀的代码库理解和执行能力
- ✅ ChatGLM 提供实惠且质量不错的中文编程支持
- ✅ 整套方案月费可以控制在 ¥50 以内

如果你正在寻找 Cursor 或 GitHub Copilot 的替代方案，这个组合值得一试。

---

## 参考链接

- [Claude Code GitHub](https://github.com/anthropics/claude-code)
- [Claude Code 官方文档](https://code.claude.com/docs/en/overview)
- [智谱 AI 开放平台](https://open.bigmodel.cn)
- [智谱 AI 价格页面](https://open.bigmodel.cn/pricing)
- [Claude Developers Discord](https://anthropic.com/discord)

---

有问题欢迎在评论区留言交流！🚀
