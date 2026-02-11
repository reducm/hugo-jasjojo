# RSS订阅支持

## 概述

本项目已添加RSS订阅功能，支持多种方式订阅网站内容。

## RSS源地址

| 类型 | 地址 |
|------|------|
| 全站订阅 | https://jasjojo.com/index.xml |
| 文章订阅 | https://jasjojo.com/posts/index.xml |
| 分类订阅 | https://jasjojo.com/categories/{分类名}/index.xml |

## 技术实现

### 配置修改

在 `config.yaml` 中添加了 `outputs` 配置：

```yaml
outputs:
  home: ["html", "rss"]
  section: ["html", "rss"]
  taxonomy: ["html", "rss"]
  term: ["html", "rss"]
```

### 菜单配置

添加了RSS菜单入口：

```yaml
menu:
  main:
    - name: "RSS"
      weight: 3
      url: index.xml
      rel: "alternate"
      type: "application/rss+xml"
```

## 使用说明

### 自动更新

每次运行 `hugo` 构建时，RSS源会自动更新：
- 包含所有已发布的文章
- 按发布时间倒序排列
- 无需手动操作

### 订阅方式

1. **浏览器插件** - 安装RSS阅读器扩展，点击地址栏RSS图标订阅
2. **在线服务** - 使用 Feedly、Inoreader 等在线RSS阅读器
3. **本地应用** - 使用 NetNewsWire、Thunderbird 等本地阅读器

## 文件位置

- 主RSS模板：使用Hugo内置模板
- 生成的RSS文件：`public/index.xml`、`public/posts/index.xml` 等

## 相关文档

- [开发与部署指南](./开发与部署指南.md)
