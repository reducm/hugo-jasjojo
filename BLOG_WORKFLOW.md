# Hugo 博客开发流程文档

## 项目概述

- **仓库名称**: hugo-jasjojo
- **位置**: /Users/jojo/.openclaw/workspace/hugo-jasjojo
- **博客地址**: https://jasjojo.com/
- **主题**: hugo-coder
- **站点语言**: 中文

## 环境要求

- **Hugo 版本**: v0.101.0+extended (已安装)
- **安装位置**: /opt/homebrew/bin/hugo

## 项目结构

```
hugo-jasjojo/
├── archetypes/       # 模板文件，用于创建新内容
├── assets/          # 资源文件
├── content/         # 博客内容目录
│   ├── posts/       # 博客文章
│   ├── projects/    # 项目页面
│   └── about.md     # 关于页面
├── static/          # 静态文件（图片、CSS、JS等）
├── themes/          # 主题目录
├── config.yaml      # 配置文件
└── README.md        # 项目说明
```

## 开发流程

### 1. 启动开发服务器

在项目根目录运行：

```bash
cd /Users/jojo/.openclaw/workspace/hugo-jasjojo
hugo server --bind 0.0.0.0 --port 1313
```

服务器会在 `http://localhost:1313/` 启动，支持：
- 实时预览
- 自动重新加载（Fast Render 模式）
- 文件变更自动检测

### 2. 创建新博客文章

使用 Hugo 命令创建新文章：

```bash
hugo new posts/文章标题.md
```

例如：
```bash
hugo new posts/test-blog-post.md
```

这会在 `content/posts/` 目录下创建新文件，包含默认的 front matter 模板。

### 3. 编辑博客文章

编辑 markdown 文件，格式如下：

```yaml
+++
draft = true           # 是否为草稿（true=不发布，false=发布）
date = 2026-02-04T18:27:41+08:00
title = "文章标题"
description = "文章描述"
slug = ""              # URL 别名（可选）
authors = []            # 作者列表
tags = ["标签1", "标签2"]  # 文章标签
categories = ["分类"]    # 文章分类
externalLink = ""       # 外部链接（可选）
series = []            # 系列文章（可选）
+++

文章内容在这里...

可以使用 Markdown 语法。

<!--more-->

# more 标记用于文章摘要，在此标记之前的内容会显示在列表页

## 正文开始...

```

### 4. 查看预览

- 保存文件后，Hugo 会自动检测变更并重新构建
- 在浏览器中访问 `http://localhost:1313/` 查看预览
- 草稿文章（draft=true）默认不会显示在生产环境

### 5. 发布文章

将 `draft = true` 改为 `draft = false` 即可发布文章。

## Front Matter 字段说明

| 字段 | 说明 | 示例 |
|------|------|------|
| `draft` | 是否为草稿 | `true` 或 `false` |
| `date` | 文章日期 | `2026-02-04T18:27:41+08:00` |
| `title` | 文章标题 | `"我的第一篇文章"` |
| `description` | 文章描述 | `"这是一篇测试文章"` |
| `slug` | URL 别名（可选） | `"my-first-post"` |
| `authors` | 作者列表 | `["作者名"]` |
| `tags` | 文章标签 | `["技术", "教程"]` |
| `categories` | 文章分类 | `["开发"]` |
| `externalLink` | 外部链接（可选） | `"https://..."` |
| `series` | 系列文章（可选） | `["Hugo入门系列"]` |

## Markdown 语法支持

该博客支持标准 Markdown 语法，包括：

### 标题
```markdown
# H1 标题
## H2 标题
### H3 标题
```

### 代码块
\```
代码内容
\```

或指定语言：
\```python
def hello():
    print("Hello, World!")
\```

### 引用
```markdown
> 这是一段引用
```

### 列表
```markdown
- 无序列表项 1
- 无序列表项 2

1. 有序列表项 1
2. 有序列表项 2
```

### 链接和图片
```markdown
[链接文字](https://example.com)
![图片描述](/images/image.png)
```

### 分隔线
```markdown
---
```

### 表格
```markdown
| 列1 | 列2 |
|-----|-----|
| 值1 | 值2 |
```

## 主题配置

当前使用的主题是 `hugo-coder`，主要配置在 `config.yaml` 中：

```yaml
params:
  author: JAS
  info: 工程师技术分享网站
  description: 全栈工程师/编程语言类/后端开发/devops/前端/游戏技术等
  keywords: blog,developer,personal
  avatarurl: images/avatar.png
  since: 2012
  colorScheme: auto  # 自动切换明暗主题
```

## 菜单结构

```yaml
menu:
 main:
  - name: "文档"
    weight: 1
    url: posts/
  - name: "项目"
    weight: 2
    url: projects/
```

## 分类和标签

文章可以通过 `categories` 和 `tags` 字段进行分类：

- **categories**: 文章的主要分类
- **tags**: 文章的标签，用于更细粒度的索引

## 开发命令汇总

```bash
# 启动开发服务器
hugo server --bind 0.0.0.0 --port 1313

# 创建新文章
hugo new posts/文章标题.md

# 构建静态网站（生产环境）
hugo

# 检查配置
hugo config

# 查看版本
hugo version

# 列出所有草稿
hugo list drafts

# 列出所有已发布内容
hugo list published
```

## 注意事项

1. **文件编码**: 使用 UTF-8 编码
2. **图片资源**: 放在 `static/` 目录下
3. **草稿管理**: `draft = true` 的文章不会发布
4. **日期格式**: 使用 ISO 8601 格式（`YYYY-MM-DDTHH:MM:SS+08:00`）
5. **URL 生成**: Hugo 会根据文件名自动生成 URL，可以使用 `slug` 字段自定义

## 部署流程

### 服务器信息

- **服务器**: tcloud
- **代码目录**: /home/jojo/project/hugo-jasjojo
- **构建目录**: /home/jojo/project/hugo
- **构建命令**: hugo

### 部署步骤

#### 1. 提交代码到本地仓库

```bash
cd /Users/jojo/.openclaw/workspace/hugo-jasjojo
git add -A
git commit -m "提交说明"
```

#### 2. 推送到 GitHub 远程仓库

```bash
git push
```

#### 3. SSH 连接到服务器

```bash
ssh jojo@tcloud
```

#### 4. 拉取最新代码

```bash
cd /home/jojo/project/hugo-jasjojo
git pull origin main
```

#### 5. 构建静态网站

```bash
cd /home/jojo/project/hugo
hugo
```

#### 6. 退出服务器

```bash
exit
```

### 完整部署脚本

可以创建一个部署脚本 `deploy.sh`:

```bash
#!/bin/bash
# 本地提交
git add -A
git commit -m "Deploy: $1"
git push

# 服务器部署
ssh jojo@tcloud << 'ENDSSH'
  cd /home/jojo/project/hugo-jasjojo
  git pull origin main
  cd /home/jojo/project/hugo
  hugo
ENDSSH
```

使用方法：
```bash
chmod +x deploy.sh
./deploy.sh "部署说明"
```

### 部署检查

部署完成后，访问 https://jasjojo.com/ 检查：
- ✅ 首页是否正常加载
- ✅ 新文章是否显示
- ✅ 导航菜单是否正确
- ✅ 分类和标签是否正常工作

## 下一步

- 部署流程（待补充）
- 博客写作辅助功能（待开发）

---

**文档创建日期**: 2026-02-04
**最后更新**: 2026-02-04
