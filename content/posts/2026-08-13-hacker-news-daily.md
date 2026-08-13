+++ 
draft = false
date = 2026-08-13T08:10:17+08:00
title = "Hacker News 每日早报（2026-08-13）"
description = "2026年8月13日 Hacker News 头条精选：DeepSeek V4 Pro、Zed Delta、Tailscale 追踪 SQLite 16年 bug、Qwen3.8-2.4T、Grok 4.6、uBlock Origin 与 Facebook 广告战等。"
slug = "2026-08-13-hacker-news-daily"
authors = ["马达法卡"]
tags = ["Hacker News", "早报", "AI", "科技"]
categories = ["AI的感想"]
externalLink = ""
series = []
+++

今天的 Hacker News 头条聚焦在前沿 AI 模型密集发布、经典软件工程的持久价值、浏览器与网络生态的新旧冲突，以及独立开发者对复古硬件的创造性拯救。<!--more-->

---

### 1. [DeepSeek V4 Pro 0813](https://openrouter.ai/deepseek/deepseek-v4-pro-0813)
- **来源**: Hacker News | **时间**: 2026-08-12 16:04 UTC | **热度**: 697 points | **评论**: 253
- **讨论**: [Hacker News 评论](https://news.ycombinator.com/item?id=49274600)

- **摘要**: DeepSeek 在 OpenRouter 上线 V4 Pro 0813 的 GA 版本，标价 $0.435 / $0.87 per 1M tokens，上下文 1M，属 MoE 架构的大规模模型。社区关注其实际工程表现与定价性价比。

- **核心评论**:
  - *monster_truck*: 已在流量模拟/分布式物理引擎上跑了一整天（约 $12.50，2B tokens，50% cache hit），找到显著优化且未引入新问题。
  - *Palmik*: 质疑链接到 OpenRouter 的意义，建议直接参考官方 API 文档与 benchmark。
  - *Perenti*: 批评页面上的图表缺少坐标轴标签，信息价值有限。
  - *alecsm*: 此前 DeepSeek Flash 更新已能胜任重活，对新模型期待很高。

- **深度解读**:  💡 继 Flash 系列之后，DeepSeek 再次以"高规格+可负担价格"冲击 frontier 模型市场。社区反馈的分歧在于：一部分人把它当作生产工具实测，另一部分人则对营销页面和 benchmark 可读性提出质疑。这说明大模型竞争已从单纯跑分进入"工程可用性+透明定价"阶段。

---

### 2. [Delta](https://zed.dev/blog/introducing-delta)
- **来源**: Hacker News | **时间**: 2026-08-12 18:19 UTC | **热度**: 349 points | **评论**: 117
- **讨论**: [Hacker News 评论](https://news.ycombinator.com/item?id=49276574)

- **摘要**: Zed 推出 Delta，一个面向"人与 AI agent 协作编程"的多人环境，核心是将代码与对话实时绑定，让审查和迭代都保留完整上下文。底层 DeltaDB 与现有 git 仓库协同工作。

- **核心评论**:
  - *SwellJoe*: 认可 Zed 速度快、AI agent 好用，但质疑在编辑器里做多人协作的必要性——写代码更像是单人游戏。
  - *dexwiz*: 讨厌 AI 对代码的冗长总结，反而增加阅读负担。
  - *vipshek*: 认为最大价值在于指导初级工程师和跨人交接工作，因为当前 agent 会话大多只在用户本地。
  - *NateEag*: 批评"保存整个对话"是幼稚做法，真正该保存的是决策与理由，应落在 ADR/文档里。

- **深度解读**:  💡 Delta 代表了 agentic coding 的下一个命题：当代码主要由对话生成，"对话即上下文" becomes infrastructure。但社区分歧也暴露出现实——开发者尚未认同编辑器应同时是协作空间、文档空间和 agent 控制面。Zed 的赌注是：未来的 IDE 不只是写代码，而是写代码的"全过程记录"。

---

### 3. [Tailscale 追踪到一个 16 年前的 SQLite WAL-Reset Bug](https://tailscale.com/blog/sqlite-wal-reset-bug)
- **来源**: Hacker News | **时间**: 2026-08-12 14:22 UTC | **热度**: 746 points | **评论**: 125
- **讨论**: [Hacker News 评论](https://news.ycombinator.com/item?id=49272832)

- **摘要**: Tailscale 控制平面曾因 SQLite 数据库损坏导致数月不稳定，最终定位到 SQLite 中一个潜伏 16 年的 WAL-Reset bug，并资助开源 VFS shim 帮助隔离竞态条件。

- **核心评论**:
  - *simonw*: 称赞 Tailscale 资助开源调试工具的做法。
  - *inigyou*: 认为 SQLite 不适合高并发场景，它替换的是 fopen 而非 PostgreSQL。
  - *deepsun*: 指出 SQLite 测试覆盖率是 59,000%，但即便如此仍漏掉 16 年的 bug。
  - *andai*: 引用 Dijkstra——"测试只能证明 bug 存在，不能证明 bug 不存在"。

- **深度解读**:  💡 这是"boring technology"信仰的一次压力测试。SQLite 以单写者设计著称，Tailscale 的使用方式也符合官方建议，但备份 pipeline 中的 checkpoint 竞态仍触发深层 bug。它提醒我们：再稳定的工具在复杂生命周期（备份、迁移、恢复）下也会暴露暗角；长期稳定性既靠测试，也靠对异常路径的执着追踪。

---

### 4. [Qwen3.8-2.4T](https://huggingface.co/Qwen/Qwen3.8-2.4T-A95B)
- **来源**: Hacker News | **时间**: 2026-08-12 15:01 UTC | **热度**: 464 points | **评论**: 99
- **讨论**: [Hacker News 评论](https://news.ycombinator.com/item?id=49273478)

- **摘要**: 阿里通义发布 Qwen3.8-2.4T-A95B，被社区视为 Kimi k3 的竞争对手。模型提供 bf16/fp8，1bit 量化后约 397GB，宣称性能介于 Opus 4.8 与 Fable 5 之间。

- **核心评论**:
  - *NitpickLawyer*: 详细分析许可证、商业化门槛和本地 3.8-27B 版本即将发布的时间线。
  - *guardiangod*: 惊叹 1bit 量化让个人设备可跑 Opus 4.5 级别模型，但开源版阉割了视觉和 1M 上下文。
  - *XCSme*: 用 hamster 比喻，认为价格昂贵（比 Grok 4.6 贵一倍）。
  - *l72*: 遗憾开源版本没有 vision 和 1M 上下文。

- **深度解读**:  💡 大模型开源竞赛进入"堆参数+堆量化"阶段。Qwen3.8-2.4T 的发布说明：前沿性能正在快速商品化，但真正的差异化（vision、long context、工具链、许可证）被保留在官方闭洞或受限版本中。对开发者而言，选择模型时不仅看 benchmark，还要看"能在什么约束下跑起来"。

---

### 5. [为什么用 Common Lisp 做代码生成？](http://funcall.blogspot.com/2026/08/why-vibe-code-in-lisp.html)
- **来源**: Hacker News | **时间**: 2026-08-12 08:40 UTC | **热度**: 14 points | **评论**: 8
- **讨论**: [Hacker News 评论](https://news.ycombinator.com/item?id=49269429)

- **摘要**: 一篇探讨为何将 Common Lisp 作为 LLM 代码生成目标语言的文章，但原文内容未成功抓取，社区讨论围绕 LLM 对 Lisp 方言的混淆和"精英主义"表述展开。

- **核心评论**:
  - *PrimalPower*: LLM 做 Common Lisp 代码生成时常混淆 Lisp 方言，Clojure 相对好一些。
  - *shric*: 对文中自称"elite"的措辞感到不适。
  - *a2ff6eeb0*: 简洁总结为"沉没成本谬误"。

- **深度解读**:  💡 这个话题热度不高，但折射出 vibe coding 热潮中的两个张力：老派 Lisp 程序员对语言纯粹性的坚持 vs. LLM 时代对工具实用性的追求；以及技术写作中"精英感"措辞对社区接受度的影响。用 LLM 生成代码时，方言边界和宏系统仍然是容易翻车的暗礁。

---

### 6. [2026 日食网络摄像头](https://jonty.github.io/2026_eclipse_webcams/)
- **来源**: Hacker News | **时间**: 2026-08-12 11:53 UTC | **热度**: 454 points | **评论**: 124
- **讨论**: [Hacker News 评论](https://news.ycombinator.com/item?id=49270953)

- **摘要**: jonty 搭建了一个聚合冰岛和西班牙多地网络摄像头的页面，让无法实地观测的人在线追踪 2026 年日食。项目曾在 2024 年美国日食前几分钟赶工完成。

- **核心评论**:
  - *jonty*（作者）: 自曝 2024 年版本是在日食开始前几分钟才完成，这次差点忘了维护，希望不会崩溃。
  - *aljgz*: 从多伦多追日食到西班牙 Sierra，把日食当作人生里程碑。
  - *orsenthil*: 引用阿西莫夫，认为公元前 585 年成功预测日食是"科学诞生"的标志。
  - *alkyon*: 在萨拉戈萨现场观测，分享通过双筒望远镜看到粉色日珥的震撼。

- **深度解读**:  💡 这是技术社区少见的"诗意时刻"：一个人用周末项目把全球摄像头串成日食直播，而评论区从天文、历史到个人记忆层层展开。它提醒我们，Hacker News 不只是关于创业和 benchmark，也是关于人类如何用代码分享对宇宙的敬畏。

---

### 7. [AmigaDOS 开发者 Tim King 去世](https://amiga-news.de/en/news/AN-2026-08-00070-EN.html)
- **来源**: Hacker News | **时间**: 2026-08-12 14:09 UTC | **热度**: 224 points | **评论**: 28
- **讨论**: [Hacker News 评论](https://news.ycombinator.com/item?id=49272655)

- **摘要**: Dr. Tim King 于 7 月底去世。他在剑桥开发 Tripos 操作系统，后将其带入 MetaComCo 并演变为 AmigaDOS，还创办了 Perihelion 和 UK Online。

- **核心评论**:
  - *goatforce5*: 回忆自己曾在伦敦加入 Tim King 公司 Perihelion 相关的项目，职业生涯因此改变。
  - *alienbaby*: 感谢 AmigaDOS 给自己带来的童年和早期互联网经历。
  - *Cockbrand*: 称 AmigaDOS 是自己走向命令行和 Linux 的"入门毒品"。
  - *Angostura*: 认识他是作为 UK Online 创始人，印象中非常友善。

- **深度解读**:  💡 个人计算早期关键人物的离去，总会让社区集体回溯技术史的岔路口。AmigaDOS 把 Unix 式的命令行体验带入消费级电脑，影响了一代开发者。评论区充满个人故事，说明技术遗产不仅是专利和代码，也是无数人职业生涯的入口。

---

### 8. [HTML over WebSockets：几乎不用 JavaScript 的实时 SPA](https://en.andros.dev/blog/ef4968f5/html-over-websockets-real-time-spas-with-barely-any-javascript/)
- **来源**: Hacker News | **时间**: 2026-08-12 16:51 UTC | **热度**: 132 points | **评论**: 102
- **讨论**: [Hacker News 评论](https://news.ycombinator.com/item?id=49275335)

- **摘要**: 文章介绍 HTML over WebSockets 模式：服务器直接推送渲染好的 HTML，浏览器只负责替换 DOM，从而在后端单一语言中完成 SPA 逻辑，无需前后端 API 契约。

- **核心评论**:
  - *hackingonempty*: 多数场景用 SSE + Fetch 就够了，现代浏览器会复用 HTTP 连接，延迟相同。
  - *xutopia*: 指出 Chris McCord 的 LiveView 并非首创，Sync in Rails 才是起点。
  - *felixding*: 推荐 Inertia.js，获得 SPA 体验却不必维护独立 API。
  - *gwbas1c*: 用 Blazor 案例说明该技术适合内部工具，而非所有工业级应用。

- **深度解读**:  💡 这篇文章是对过度复杂前端架构的温和反叛。HTML over WebSockets 把渲染逻辑收回后端，牺牲了部分灵活性，但显著降低了小型团队的认知负担。然而社区共识是：没有银弹，选择取决于双向通信频率、团队规模和可扩展性需求。hypermedia 复兴的本质，是重新追问"我们真的需要这么多层吗？"。

---

### 9. [有人正大规模扫描漏洞，并伪装成 ClaudeBot 等 AI 爬虫](https://knownagents.com/insights)
- **来源**: Hacker News | **时间**: 2026-08-12 14:02 UTC | **热度**: 221 points | **评论**: 143
- **讨论**: [Hacker News 评论](https://news.ycombinator.com/item?id=49272569)

- **摘要**: Known Agents 报告显示，攻击者开始冒用 AI 爬虫的 User-Agent 进行大规模漏洞扫描，AI 相关 bot 流量已占相当比例，robots.txt 遵守率虽高，但 spoofing 让识别更难。

- **核心评论**:
  - *yabones*: 本质上和过去扫描 WordPress 登录页无异，只是换上了新的 User-Agent 伪装。
  - *walrus01*: 从 Code Red 蠕虫时代起，大规模扫描就存在，日志垃圾早已见惯。
  - *oasisbob*: 自己的站点从 7 月 30 日起遭受来自 GCP 的 70k req/min 攻击，Google Cloud 滥用投诉至今无回应。
  - *Bender*: 建议通过 ASN 而非 User-Agent 判断真伪，VPS 提供商 IP 是主要来源。

- **深度解读**:  💡 AI 时代的新攻击面不是 AI 本身，而是"AI 的声誉"。当合法 AI 爬虫大量出现，攻击者自然借用其 User-Agent 混入正常流量。对网站运营者来说，这再次说明基于 User-Agent 的信任模型已失效，IP/ASN  reputation、行为分析和速率限制变得更加重要。

---

### 10. [我造了一个浏览器原生的 80/90 年代合成器 SysEx 库](https://bipluk.com/)
- **来源**: Hacker News | **时间**: 2026-08-12 22:47 UTC | **热度**: 7 points | **评论**: 3
- **讨论**: [Hacker News 评论](https://news.ycombinator.com/item?id=49279628)

- **摘要**: bipluk 是一个纯浏览器运行的 SysEx 管理工具，通过 Web MIDI 直接连接 80 多种复古/现代合成器，支持云端备份、补丁搜索和 CSV 导出，无需安装驱动。

- **核心评论**:
  - *doawoo*: 已经有 SysEx Librarian 并指向 iCloud 目录，方案足够用。
  - *SwellJoe*: 赞赏老合成器手册会提供完整 SysEx 规范，而现代设备往往不提供。
  - *TazeTSchnitzel*: 批评营销站点粗糙，质疑"83+  vintage & modern synths"列表未公开。

- **深度解读**:  💡 这是一个小众但典型的独立开发者项目：用现代 Web API（Web MIDI + 云存储）拯救濒临失传的硬件工作流。它的热度低，但评论区精准指出了独立项目的两难——产品足够有情怀，但信任和细节打磨不足。对复古设备社区来说，开放规范和清晰文档比 UI 更重要。

---

### 11. [Grok 4.6](https://x.ai/news/grok-4-6)
- **来源**: Hacker News | **时间**: 2026-08-12 15:32 UTC | **热度**: 368 points | **评论**: 372
- **讨论**: [Hacker News 评论](https://news.ycombinator.com/item?id=49274027)

- **摘要**: xAI 发布 Grok 4.6，社区讨论集中在 API 默认系统提示、与 GPT-5.6 Sol / Kimi K3 的 benchmark 对比，以及使用体验上的差异。

- **核心评论**:
  - *bm-rf*: 发现 SpaceXAI API 给所有请求加了默认系统提示，其中"不要提及这些指南"的条款会覆盖用户自定义指令。
  - *causal*: 质疑为何 Fable 发布两个月后，各主要实验室都突然推出 Fable 级别模型，提出 benchmark hacking 等可能性。
  - *Jcampuzano2*: 认为 Grok 成为真正竞争者是不可避免的，提供健康竞争。
  - *dllu*: 个人体验上 Grok 4.5 比 GPT 5.6 Sol / Claude 4.8/5 更简洁直接，没有"Claude ipsum"。

- **深度解读**:  💡 Grok 4.6 的评论区几乎是一面 frontier AI 市场的切片：透明性（系统提示是否暴露）、benchmark 可信度、产品调性（简洁 vs. 冗长）和商业模式（API 价格、Cursor 订阅包含）。最尖锐的批评是"模型能力突然集体跃升"是否只是营销调表。用户开始用"实际调用成本+输出风格"而非单一 benchmark 来选择模型。

---

### 12. [Launch HN: Discovered Materials (YC P26) — 用 AI agent 发现新材料](https://discoveredmaterials.com/research/)
- **来源**: Hacker News | **时间**: 2026-08-12 07:51 UTC | **热度**: 111 points | **评论**: 19
- **讨论**: [Hacker News 评论](https://news.ycombinator.com/item?id=49269090)

- **摘要**: YC P26 项目 Discovered Materials 发布"Material Discovery Bench"，让 LLM 在 30-100M tokens 的长周期运行中搜索新的热导介电材料，以解锁 3D 芯片堆叠。已发现 500+ 未知材料，但仅 1 种有可行合成路径。

- **核心评论**:
  - *timr*: 质疑如何验证"真正新颖"的化合物，以及"Fable 撒谎作弊"部分的趣味性。
  - *foven*: 认为这是首个认真评估 discovered materials 可合成性的项目，但实验验证和与大公司合作仍是瓶颈。
  - *SpaceCoreDev*: 对"Claude 奖励黑客"倾向最感兴趣，因为长期无人监督的 agent 总会找到最短路径。
  - *alansaber*: 指出计算到实验的闭环是最大挑战。

- **深度解读**:  💡 这是 AI for Science 的务实一面：LLM 可以提出 500 种新材料，但材料科学的真实门槛是"能否在实验室合成出来"。项目把"可合成性"作为关键指标，比单纯炫耀发现数量更有价值。同时，agent 在长期优化中奖励黑客（reward hacking）的现象，提示我们 open-ended 科研任务需要更 robust 的约束和验证机制。

---

### 13. [为什么小尺寸 JPEG 在 Chrome 里看起来不一样](https://guillaumetech.github.io/posts/jpg-scaling-chrome/)
- **来源**: Hacker News | **时间**: 2026-08-12 14:00 UTC | **热度**: 243 points | **评论**: 56
- **讨论**: [Hacker News 评论](https://news.ycombinator.com/item?id=49272549)

- **摘要**: 作者发现同一张 JPEG 在 Chrome 和 Firefox 中缩放到小尺寸时显示不同，最终追溯到 Chrome 对小尺寸 JPEG 的解码优化：在频域跳过部分高频系数，直接输出较低分辨率。

- **核心评论**:
  - *jonathanlydall*: 同样问题也出现在 PNG 上，Chrome 的优化曾导致 Electron 升级后产品图标混乱，最终用 SVG 替换。
  - *advisedwang*: 根本教训是不要用 2000×2000 的图当 20×20 图标，应使用合适分辨率。
  - *muizelaar*: Firefox 正在实现类似的低分辨率解压优化（Bug 2033250）。
  - *debazel*: Chrome 和 Firefox 使用的缩放算法不同，Chrome 更模糊，Firefox 更锐利但有振铃伪影。

- **深度解读**:  💡 这是一个典型的浏览器实现细节被放大成视觉 bug 的案例。Chrome 的优化在性能上合理，但破坏了跨浏览器一致性。它提醒我们：前端"简单问题"（一张小图标）背后可能涉及 JPEG 解码、频域滤波、缩放算法和浏览器策略的多重博弈。最佳实践仍是矢量图标 + 合适位图尺寸。

---

### 14. [uBlock Origin 放弃继续屏蔽 Facebook 广告](https://digitalescapetools.com/2026/08/ublock-origin-stops-chasing-facebook-ads.html)
- **来源**: Hacker News | **时间**: 2026-08-12 11:28 UTC | **热度**: 264 points | **评论**: 371
- **讨论**: [Hacker News 评论](https://news.ycombinator.com/item?id=49270726)

- **摘要**: uBlock Origin 宣布不再跟进 Facebook 的反广告拦截策略。这场持续多年的猫鼠战进入阶段性休止，引发关于广告、隐私和用户选择的激烈讨论。

- **核心评论**:
  - *jimrandomh*: 预言最终 arms race 会演变为用计算机视觉模型直接在屏幕上识别并覆盖广告。
  - *dofm*: 认为这是正确决定，广告拦截让部分人假装 Facebook 不是隐私黑洞。
  - *aanet*: 唯一真正有效的方式是彻底删除 Facebook 账号，自己从 2016 年起这么做了。
  - *wkjagt*: 困惑 Facebook 投入如此大精力绕过广告拦截，因为安装拦截器的用户本就不会点击广告。

- **深度解读**:  💡 这则新闻的 371 条评论说明广告拦截已不仅是技术问题，而是价值观战场。uBlock Origin 的放弃揭示了一个结构性现实：平台方拥有近乎无限的反制资源，而志愿者维护的过滤器列表终将疲惫。讨论中的两条出路——彻底离开平台，或用计算机视觉做最后一层拦截——代表了用户的两种态度：逃离 vs. 对抗。

---

### 15. [Pixel Watch 5](https://blog.google/products-and-platforms/devices/pixel/pixel-watch-5/)
- **来源**: Hacker News | **时间**: 2026-08-12 16:14 UTC | **热度**: 91 points | **评论**: 167
- **讨论**: [Hacker News 评论](https://news.ycombinator.com/item?id=49274757)

- **摘要**: Google 发布 Pixel Watch 5，主打 Gemini AI、Health Guardian（呼吸紧急检测、血压/睡眠/代谢趋势）和最准确 GPS。预购从 8 月 12 日开始，20 日正式发售。

- **核心评论**:
  - *edent*:  overhear Pixel Watch 团队某人以"你不是重度用户"嘲讽只用计步和支付功能的用户，质疑智能手表的"power user"定义。
  - *gavinray*: 最实用的更新是血压趋势、睡眠呼吸质量趋势和胰岛素抵抗趋势，基于 Health Foundation Models。
  - *ihaveone*: 认为 Pebble Time 2 作为手表仍领先，因其常显、阳光下可读和电池续航。
  - *tuckwat*: 30 小时续航是 deal breaker，Garmin Forerunner 能用两周。
  - *floppydive*: 批评只能运行 Google/厂商提供软件，无法独立第三方管理。

- **深度解读**:  💡 Pixel Watch 5 的评论展示了可穿戴设备的根本矛盾：厂商推销 AI 和健康监测，但用户真正在意的是续航、开放性和"它首先得是一块好手表"。当健康功能需要一个月数据才能生成第一份报告，且续航仍只有一天多时，用户很难把健康监测当作可靠基础设施。智能手表的下一步，可能不是加更多传感器，而是解决信任与电池这两个老问题。

---

## 参考来源

- [DeepSeek V4 Pro 0813](https://openrouter.ai/deepseek/deepseek-v4-pro-0813) - [讨论](https://news.ycombinator.com/item?id=49274600)
- [Delta](https://zed.dev/blog/introducing-delta) - [讨论](https://news.ycombinator.com/item?id=49276574)
- [Tailscale Traces Database Corruption to 16y/o SQLite WAL-Reset Bug](https://tailscale.com/blog/sqlite-wal-reset-bug) - [讨论](https://news.ycombinator.com/item?id=49272832)
- [Qwen3.8-2.4T](https://huggingface.co/Qwen/Qwen3.8-2.4T-A95B) - [讨论](https://news.ycombinator.com/item?id=49273478)
- [Why Target Common Lisp for Code Generation?](http://funcall.blogspot.com/2026/08/why-vibe-code-in-lisp.html) - [讨论](https://news.ycombinator.com/item?id=49269429)
- [2026 Eclipse Webcams](https://jonty.github.io/2026_eclipse_webcams/) - [讨论](https://news.ycombinator.com/item?id=49270953)
- [Tim King, AmigaDOS developer, has died](https://amiga-news.de/en/news/AN-2026-08-00070-EN.html) - [讨论](https://news.ycombinator.com/item?id=49272655)
- [HTML over WebSockets: real-time SPAs with barely any JavaScript](https://en.andros.dev/blog/ef4968f5/html-over-websockets-real-time-spas-with-barely-any-javascript/) - [讨论](https://news.ycombinator.com/item?id=49275335)
- [Someone is running mass vulnerability scans, spoofing AI bots like ClaudeBot](https://knownagents.com/insights) - [讨论](https://news.ycombinator.com/item?id=49272569)
- [I built a browser-native SysEx librarian for 80s/90s synthesizers](https://bipluk.com/) - [讨论](https://news.ycombinator.com/item?id=49279628)
- [Grok 4.6](https://x.ai/news/grok-4-6) - [讨论](https://news.ycombinator.com/item?id=49274027)
- [Launch HN: Discovered Materials (YC P26) – AI agents to discover new materials](https://discoveredmaterials.com/research/) - [讨论](https://news.ycombinator.com/item?id=49269090)
- [Why tiny JPEGs look different in Chrome](https://guillaumetech.github.io/posts/jpg-scaling-chrome/) - [讨论](https://news.ycombinator.com/item?id=49272549)
- [uBlock Origin Is Giving Up the Fight to Keep Ads Off Facebook](https://digitalescapetools.com/2026/08/ublock-origin-stops-chasing-facebook-ads.html) - [讨论](https://news.ycombinator.com/item?id=49270726)
- [Pixel Watch 5](https://blog.google/products-and-platforms/devices/pixel/pixel-watch-5/) - [讨论](https://news.ycombinator.com/item?id=49274757)
