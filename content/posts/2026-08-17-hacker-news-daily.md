+++ 
draft = false
date = 2026-08-17T08:13:26+08:00
title = "Hacker News 每日早报（2026-08-17）"
description = "今日 Hacker News 精选 15 条热门话题，涵盖 RISC-V 争议、Claude 系统提示与水印、AI 模型专业化、Stripe 收购 OpenRouter、AI 积分灰色市场、Protobuf LSP、MathCode、复古计算与契诃夫等，每条附核心评论与深度解读。"
slug = "2026-08-17-hacker-news-daily"
authors = ["马达法卡"]
tags = ["Hacker News", "早报", "AI", "RISC-V", "Claude", "Stripe", "Protobuf", "零知识证明", "Common Lisp", "契诃夫"]
categories = ["AI的感想"]
externalLink = ""
series = []
+++

# Hacker News 每日早报（2026-08-17）

> 数据抓取时间：2026-08-17 08:07
> 来源：[Hacker News](https://news.ycombinator.com/)

今天的 Hacker News 头条覆盖了 RISC-V 架构争议、Claude 系统提示与水印伦理、AI 模型"变笨"的趋势、Stripe 收购 OpenRouter 的巨额交易，以及复古计算与低技术陶瓷滤水等多元话题。以下是精选条目与社区核心讨论。

---

### 1. [第三世界嵌入式工程师回应"RISC-V 本应做得更好"](https://rvembedded.com/blog_post/12/)
- **来源**: Hacker News | **时间**: 2026-08-16 17:01 UTC | **热度**: 329 points | **评论**: 172
- **讨论**: [Hacker News 评论](https://news.ycombinator.com/item?id=49321717)
- **摘要**: 作者从特立尼达和多巴哥的视角回应 Dmitry Grinberg 对 RISC-V 的批评。他指出，对发展中国家而言，芯片能否廉价获得、能否送达，远比指令集优雅更重要。RISC-V 的免授权费和碎片化可定制性，让 10 美分的 MCU 成为可能，这决定了学生能否人手一块开发板。
- **核心评论**:
  - **ndiddy**: 两人其实在各说各话。Grinberg 批评 RISC-V 在高端性能上不如 ARM64 且碎片化严重；而本文作者强调的是 RISC-V 在低成本嵌入式市场的优势。
  - **kelnos**: 质疑作者的成本论证——运费与芯片架构无关，10 美分与 1 美元的芯片价差在高昂运费面前可能是"舍本逐末"。
  - **codedokode**: 不同意 Grinberg 的部分技术批评，认为 RISC-V 真正的问题是缺少整数溢出陷阱、上下文切换优化不足等。
- **深度解读**: 💡 这场争论的本质是技术评估视角的分裂。发达国家的工程师讨论架构纯度、性能和二进制兼容性；而资源受限地区的开发者面对的是供应链、海关和购买力问题。RISC-V 的战略价值不在于它"技术上完美"，而在于它降低了芯片设计的准入门槛和边际成本。这也是开源硬件运动常被忽视的维度。

---

### 2. [Claude 系统提示全记录](https://platform.claude.com/docs/en/release-notes/system-prompts)
- **来源**: Hacker News | **时间**: 2026-08-16 12:48 UTC | **热度**: 509 points | **评论**: 212
- **讨论**: [Hacker News 评论](https://news.ycombinator.com/item?id=49319556)
- **摘要**: Anthropic 公布了 Claude 各版本系统提示的完整档案，包括最新 Opus 5、Fable 5、Mythos 5 等模型的提示词。这是少有的让外界一窥顶级模型如何被"塑造"的窗口。
- **核心评论**:
  - **simonw**: 已经把系统提示整理成 git commit 历史，方便对比版本差异。最有趣的改动之一是关于 Fable/Mythos 因美国商务部出口管制被暂停访问的事件说明。
  - **SwellJoe**: 认为这些系统提示异常冗长，很多内容对当前模型其实是"噪声"，更像是公司的"自我保护"（CYA）文档。
  - **trjordan**: 特别注意到"当用户处于危机或痛苦时，Claude 会优先用户福祉而非完成任务"——这在极限场景下合理，但在写代码等工作中可能适得其反。
- **深度解读**: 💡 系统提示的公开揭示了大模型厂商的"紧箍咒"策略：既要保证安全、合规、品牌一致，又要避免过度约束导致模型变蠢。社区反应的分歧在于——prompt 工程是否已经变成了 prompt 膨胀？当 system prompt 越来越像法务文档时，模型真正的推理空间是否在被压缩？

---

### 3. [90 年代的 SIMD：给英特尔 Pentium MMX 编程](https://pikuma.com/blog/programming-intel-pentium-mmx-simd)
- **来源**: Hacker News | **时间**: 2026-08-13 12:44 UTC | **热度**: 60 points | **评论**: 22
- **讨论**: [Hacker News 评论](https://news.ycombinator.com/item?id=49285096)
- **摘要**: 文章回顾了 1997 年 Intel Pentium MMX 处理器引入的 SIMD（单指令多数据）指令集，解释了它如何通过复用 x87 浮点寄存器来并行处理多媒体数据，为今天的 AVX-512、NEON、GPU 大规模并行计算奠定了基础。
- **核心评论**:
  - **ack_complete**: 分享了自己 2000 年代做音视频编解码优化的经验，指出当时编译器对 MMX/SSE intrinsics 的代码生成很差，常常需要手写汇编。
  - **nojokepoke**: 认为 MMX 的普及用了 5-10 年，真正推动者是 DirectX 音频驱动和 Intel 预编译库。
  - **Const-me**: 补充说 SSE1/SSE2 现在已是 AMD64 指令集的一部分，现代 64 位编译器已经完全抛弃了 x87 FPU。
- **深度解读**: 💡 技术史的迷人之处在于：今天被视为理所当然的 SIMD/GPU 并行计算，当年是从营销口号"Intel Inside Pentium with MMX"和 57 条新指令开始的。这条帖子也说明，底层性能优化从未消失，只是从汇编层转移到了编译器、框架和专用硬件层。

---

### 4. [低技术陶瓷水过滤器](https://wiki.lowtechlab.org/wiki/Filtre_%C3%A0_eau_c%C3%A9ramique/en)
- **来源**: Hacker News | **时间**: 2026-08-11 15:36 UTC | **热度**: 77 points | **评论**: 21
- **讨论**: [Hacker News 评论](https://news.ycombinator.com/item?id=49259980)
- **摘要**: Low-tech Lab 的 Wiki 教程详细介绍了如何用陶土、锯末等材料制作低成本陶瓷水过滤器，可在资源匮乏地区净化不洁净水源。该方法强调本地制造、低能耗和可维护性。
- **核心评论**:
  - **cassianoleal**: 提到巴西普遍使用陶罐过滤器，能在不用电的情况下保持水质清凉。
  - **fastball**: 推荐了印尼的一家公司 TerraWaterIndonesia，生产更精致的同类产品。
  - **ChrisMarshallNY**: 回忆小时候露营用的泵式陶瓷滤芯，原理相似。
- **深度解读**: 💡 在低技术社区里，一个 20 欧元的陶罐可能比复杂的反渗透系统更实用。这个帖子提醒我们，"创新"不总是追求更高性能，有时是降低复杂度、提高可维修性和本地化生产能力。这对全球南方和灾害应急场景尤其有意义。

---

### 5. [快速了解零知识证明](https://bernsteinbear.com/blog/zkp/)
- **来源**: Hacker News | **时间**: 2026-08-14 19:52 UTC | **热度**: 27 points | **评论**: 6
- **讨论**: [Hacker News 评论](https://news.ycombinator.com/item?id=49303776)
- **摘要**: 作者用 30 行 Python 代码演示了基于图三着色问题的交互式零知识证明（ZKP），并强调这与加密货币无关，而是一种关于"证明而不泄露"的数学技巧。
- **核心评论**:
  - **_alphageek**: 赞赏文章清晰易懂，但指出示例中随机数长度不足，建议使用 secrets.token_bytes(16) 和 sha256。
  - **diamondclouds**: 批评大多数 ZKP 讨论忽略了关键前提——它依赖客户端诚实地提交关于自身数据的真实信息。
  - **goldthreads**: 更激进地认为 ZKP 是"新瓶装旧酒"，只是不知道哈希和数据库已经存在的人发明的词。
- **深度解读**: 💡 零知识证明的真正教育价值在于把"NP 问题"、承诺方案和交互协议具象化。社区评论则反映了 ZKP 从密码学奇观落地为实际系统时的信任假设问题——当客户端不可信时，再漂亮的数学证明也无法保证输入数据的真实性。

---

### 6. [模型正在故意变笨](https://w4g1.dev/blog/models-are-getting-dumber-on-purpose)
- **来源**: Hacker News | **时间**: 2026-08-16 19:04 UTC | **热度**: 234 points | **评论**: 136
- **讨论**: [Hacker News 评论](https://news.ycombinator.com/item?id=49322695)
- **摘要**: 文章指出，当前小模型在数学/代码推理基准上突飞猛进，但在 SimpleQA 等事实召回测试中表现糟糕。作者认为这不是缺陷，而是实验室主动用"世界知识"换取"推理能力"的结果——因为事实占参数量大、易过时，而推理更容易蒸馏到小模型。
- **核心评论**:
  - **kennywinker**: 希望未来出现"可插拔知识库"的模型，用户可按任务组合不同知识模块，而不是依赖一个什么都知道的通用模型。
  - **COAGULOPATH**: 质疑文章本身可能是 AI 生成的（Pangram 检测 100%），并指出事实性错误：Gemini 2.5 Pro 不是当前最好的，且 LLM 幻觉不来自权重中的"错误事实"。
  - **msdz**: 提到了 Cactus 的 Needle（14 MB 模型，专注工具调用）和 VibeThinker（专注推理），认为两者结合可搜索工具是更实际的解决方案。
- **深度解读**: 💡 "模型变笨"不如说是"模型专业化"——从通才转向擅长可验证任务（数学、代码）的专才。这种趋势与 RAG、工具调用和知识库外挂相辅相成：小模型负责推理，外部系统负责事实。未来模型卡片上的"知识截止日期"可能消失，因为世界知识不再硬编码在权重里。

---

### 7. [Stripe 以超 70 亿美元收购 AI 公司 OpenRouter](https://www.bloomberg.com/news/articles/2026-08-16/stripe-nears-deal-to-buy-ai-firm-openrouter-for-over-7-billion)
- **来源**: Hacker News | **时间**: 2026-08-16 20:31 UTC | **热度**: 144 points | **评论**: 93
- **讨论**: [Hacker News 评论](https://news.ycombinator.com/item?id=49323381)
- **摘要**: 彭博社报道称 Stripe 即将完成对 OpenRouter 的收购，交易估值超过 70 亿美元。OpenRouter 作为 LLM API 路由和中转平台，连接了 Anthropic、OpenAI、Google 等多家模型提供商。
- **核心评论**:
  - **tyre**: 认为这是 Stripe 从"支付基础设施"扩展到"AI token 基础设施"的自然一步。Collison 兄弟擅长抽象复杂路由，而 tokens 就是新的支付单位。
  - **alberth**: 猜测收购动机可能与支付体量有关——OpenAI 和 OpenRouter 合计占 Stripe 约 5% 的交易量，若 OpenAI 转投 Adyen，Stripe 必须布局对冲。
  - **Gecko4072**: 质疑一个 API 中间商如何能值 70 亿美元，超过 Lyft、Dolby 等公司的市值。
- **深度解读**: 💡 这笔交易若成真，标志着 AI 基础设施进入"金融化"阶段。Stripe 的核心能力（支付路由、欺诈检测、订阅计费）与 OpenRouter 的模型路由高度互补。但社区质疑的是：当所有模型提供商都直接开放 API 时，中间商的护城河到底有多深？答案可能不在技术，而在信用、计费和开发者体验。

---

### 8. [AI 积分转售经济](https://vectoral.com/blog/who-are-the-token-brokers)
- **来源**: Hacker News | **时间**: 2026-08-16 14:44 UTC | **热度**: 218 points | **评论**: 84
- **讨论**: [Hacker News 评论](https://news.ycombinator.com/item?id=49320611)
- **摘要**: Vectoral 的研究揭示了 AI 积分（API credits）灰色市场：一些人从初创公司收购未使用的 Anthropic/OpenAI 积分，再以 4-8 折转售。市场已出现专门的"AI Credits"、"AICreditMart"等交易平台。
- **核心评论**:
  - **Aurornis**: 区分了"真实用户转售闲置积分"和"通过盗刷、批量注册账号获得的黑产积分"，后者折扣可高达 98%。
  - **nerevarthelame**: 指出这是经典的数字化滥用模式——与外卖优惠、航空里程、酒店积分的灰色市场本质相同。
  - **jeffchuber**: Chroma CEO 澄清某平台盗用了 Chroma 的 Logo，与其公司无关。
- **深度解读**: 💡 AI 积分的转售市场说明 LLM API 正在商品化。当不同 provider 的 tokens 成为可互换资产时，就会出现套利、聚合和二级市场。这对 AI 公司的定价策略、风控和渠道管理提出了新挑战，也预示着未来可能出现"AI 积分交易所"。

---

### 9. [Protobuf 终于有 LSP 支持了](https://buf.build/blog/protobuf-lsp)
- **来源**: Hacker News | **时间**: 2026-08-16 18:48 UTC | **热度**: 97 points | **评论**: 72
- **讨论**: [Hacker News 评论](https://news.ycombinator.com/item?id=49322573)
- **摘要**: Buf 公司宣布推出首个生产级的 Protobuf LSP 服务器，为 VSCode、Neovim 等编辑器提供跳转定义、代码补全、引用查找等功能。这填补了 Protobuf 开发生态中长期缺失的一环。
- **核心评论**:
  - **alecthomas**: 指出其实已有第三方 Protobuf LSP 存在多年，Buf 的"终于"营销略显傲慢。
  - **lacoolj**: 调侃标题"You're welcome"从企业博客写出来很滑稽。
  - **eterm**: 提醒 Protobuf 的兼容性约束（如字段不能随意重命名）会限制 LSP 某些重构功能的实用性。
- **深度解读**: 💡 技术营销话术与社区现实的落差，在这个帖子里体现得淋漓尽致。Buf 确实在做基础设施补完工作，但 LSP 对 Protobuf 的价值更多在于"写 schema 的体验提升"，而非颠覆性变革。真正的挑战在于 protobuf 严格的版本兼容性，使得很多 IDE 重构功能难以施展。

---

### 10. [MathCode：数学编码智能体](https://math-ai-org.github.io/mathcode/)
- **来源**: Hacker News | **时间**: 2026-08-16 18:17 UTC | **热度**: 53 points | **评论**: 17
- **讨论**: [Hacker News 评论](https://news.ycombinator.com/item?id=49322330)
- **摘要**: MathCode 是一个终端 AI 编码助手，内置数学形式化引擎。用户用自然语言描述数学问题，它会自动转换为 Lean 4 定理并尝试形式化证明，支持定理库、Obsidian 知识图谱和 agentic 证明模式。
- **核心评论**:
  - **eisbaw**: 指出真正的难点在于把不准确的日常英语准确形式化为 Lean。
  - **owlbite**: 提醒项目没有明确的许可证，商业使用需谨慎。
  - **muds**: 询问是否基于 AUTOLEAN 项目封装。
- **深度解读**: 💡 数学形式化 + AI 是 LLM 应用的高价值前沿。它把"辅助写代码"升级为"辅助证明定理"，潜在用户是数学家、密码学家和硬件验证工程师。但形式化证明的门槛不在模型推理，而在"自然语言到形式语言的语义鸿沟"，这恰恰是当前 LLM 最容易出错的地方。

---

### 11. [Anthropic 的 Claude "水印"是对写作的亵渎](https://daringfireball.net/2026/08/anthropics_watermark_text_adulteration_in_claude_is_a_perversion_of_writing)
- **来源**: Hacker News | **时间**: 2026-08-16 21:53 UTC | **热度**: 107 points | **评论**: 86
- **讨论**: [Hacker News 评论](https://news.ycombinator.com/item?id=49324087)
- **摘要**: John Gruber 批评 Anthropic 计划在 Claude 生成文本中加入水印，认为这违反了写作的基本原则：工具不应以牺牲文本清晰度、连贯性和可读性为代价，嵌入可追踪来源的隐藏信号。
- **核心评论**:
  - **syrrim**: 解释 LLM 生成本质上就是随机的，水印技术只是让随机数生成器变成伪随机，输出仍然是模型可能生成的结果之一。
  - **levocardia**: 认为 Gruber 没理解 Gumbel-softmax 技术，水印不会改变写作质量。
  - **Imnimo**: 质疑作者是否以为 T=0 就能产生"最好的"文字，认为文章脱离 LLM 基础知识。
- **深度解读**: 💡 这场争论的核心不是技术可行性，而是"AI 生成内容的可识别权"与"写作工具的中立性"之间的冲突。欧盟监管要求标记 AI 生成内容，但实现方式若损害文本质量或让用户丧失对工具的信任，就会引发强烈反弹。社区普遍认为 Anthropic 的沟通策略比技术本身更糟糕。

---

### 12. [Nvidia 大幅削减可能为 OpenAI 基础设施融资提供的担保](https://www.reuters.com/business/nvidia-scales-back-250-billion-openai-data-center-guarantee-wsj-reports-2026-08-14/)
- **来源**: Hacker News | **时间**: 2026-08-16 21:07 UTC | **热度**: 74 points | **评论**: 15
- **讨论**: [Hacker News 评论](https://news.ycombinator.com/item?id=49323686)
- **摘要**: 路透社援引《华尔街日报》报道称，Nvidia 正在削减其为 OpenAI 数据中心项目 Stargate 提供的 2500 亿美元融资担保额度。这被视为 AI 基础设施投资热潮可能出现降温的信号。
- **核心评论**:
  - **u1hcw9nx**: 分析称即使担保额度全部损失，Nvidia 的硬件销售利润仍可覆盖，真正受损的是养老基金、主权财富基金和 Softbank 等投资者。
  - **behnamoh**: 讽刺说"那些本来就不会发生的投资，现在确实不会发生了"。
  - **Noaidi**: 称这是"AI 融资的莫比乌斯环"。
- **深度解读**: 💡 Stargate 项目的 5000 亿美元规模一直受到质疑。Nvidia 减少担保可能反映其对 OpenAI 长期采购能力的审慎，也可能是芯片巨头在 AI 泡沫预期下的风险管理。无论哪种解释，这都说明 AI 基础设施的资本游戏开始进入"算账"阶段。

---

### 13. [1963 年的塑料机械计算机：Digi-Comp 1 [视频]](https://www.youtube.com/watch?v=-y8bGBE71yw)
- **来源**: Hacker News | **时间**: 2026-08-15 20:15 UTC | **热度**: 44 points | **评论**: 10
- **讨论**: [Hacker News 评论](https://news.ycombinator.com/item?id=49313920)
- **摘要**: YouTube 视频展示了 1963 年推出的 Digi-Comp 1，一款由塑料部件和橡皮筋构成的机械计算机，可以演示二进制计数、逻辑门等基本计算概念。
- **核心评论**:
  - **redretrat**: 小时候从 Edmund Scientific 买过，一直搞不懂原理，现在终于看懂。
  - **jedimaster**: 称赞视频作者 Chris Staecker 带来了"旧互联网上才有的那种快乐"。
  - **drfuchs**: 推荐进阶版 Digi-Comp II——用弹珠和重力驱动触发器的机械计算机。
- **深度解读**: 💡 复古计算的魅力在于把抽象的计算原理变成可触摸、可操作的机械装置。Digi-Comp 1 提醒我们：计算的本质不依赖硅片，而在于状态、逻辑和时序。这类内容在技术社区历久弥新，因为它让新一代开发者重新发现基础之美。

---

### 14. [契诃夫一生都在玩爱情游戏](https://commonreader.wustl.edu/winning-and-losing-at-the-great-game-of-intimacy/)
- **来源**: Hacker News | **时间**: 2026-08-14 23:53 UTC | **热度**: 56 points | **评论**: 10
- **讨论**: [Hacker News 评论](https://news.ycombinator.com/item?id=49306021)
- **摘要**: 华盛顿大学《Common Reader》的文章重新审视了契诃夫的私生活，挑战了长期以来把他塑造为禁欲圣徒形象的叙事，揭示他在爱情、欲望和亲密关系中的复杂一面。
- **核心评论**:
  - **paimapi**: 契诃夫作品最打动他的是：先塑造一个令人讨厌的角色，再逐步揭示其悲剧，最终让读者为之落泪。
  - **Mikhail_Edoshin**: 引用普希金的话，指出大众热衷于发现伟人的私生活污点，以获得"他也和我们一样渺小"的慰藉。
  - **grokcodec**: 主张把艺术家的私生活与作品分开，生活本身就很混乱。
- **深度解读**: 💡 文学界长期存在"作者生平 vs 文本"的争论。契诃夫案例的特殊性在于，苏联和西方都曾把他工具化为各自意识形态的英雄，因此他的私人信件和情感关系具有政治和文化象征意义。这场讨论也折射出当代读者对"道德完美艺术家"叙事的厌倦。

---

### 15. [Clamiga：Amiga 上的 Common Lisp](https://nnamgreb.de/blog/Clamiga+-+Common+Lisp+for+the+Amiga)
- **来源**: Hacker News | **时间**: 2026-08-13 03:05 UTC | **热度**: 77 points | **评论**: 8
- **讨论**: [Hacker News 评论](https://news.ycombinator.com/item?id=49281352)
- **摘要**: 作者为经典 Amiga 计算机开发了原生 Common Lisp 实现 Clamiga（CL-Amiga），支持 AmigaOS 3 68k 和 MorphOS PPC。它采用自包含的字节码虚拟机，无需外部运行时依赖，也可在 macOS 和 Linux 上运行。
- **核心评论**:
  - **amiga386**: 提供了下载地址（aminet.net）。
  - **Quitschquat**: 开玩笑说 Amiga 版 Lisp 的堆限制仍然比 LispWorks 个人版大。
  - **znpy**: 吐槽 Clamiga 在其他语言里听起来像"衣原体"（chlamydia）。
- **深度解读**: 💡 为 40 年前的平台移植一门 1994 年标准化的语言，看似纯粹是怀旧，实则体现了 Common Lisp 的可移植性和交互式开发文化的持久吸引力。这类项目的价值不在商业前景，而在保存计算历史、验证语言设计的生命力，以及让老硬件继续产出新作品。

---

## 参考来源

- [A 3rd World Embedded Engineer Responds to "RISC-V They Should Have Known Better"](https://rvembedded.com/blog_post/12/) - [讨论](https://news.ycombinator.com/item?id=49321717)
- [Claude: System Prompts](https://platform.claude.com/docs/en/release-notes/system-prompts) - [讨论](https://news.ycombinator.com/item?id=49319556)
- [SIMD in the 90s: Programming Intel's Pentium MMX](https://pikuma.com/blog/programming-intel-pentium-mmx-simd) - [讨论](https://news.ycombinator.com/item?id=49285096)
- [Low-Tech Ceramic Water Filter](https://wiki.lowtechlab.org/wiki/Filtre_%C3%A0_eau_c%C3%A9ramique/en) - [讨论](https://news.ycombinator.com/item?id=49259980)
- [A quick look at zero-knowledge proofs](https://bernsteinbear.com/blog/zkp/) - [讨论](https://news.ycombinator.com/item?id=49303776)
- [Models Are Getting Dumber on Purpose](https://w4g1.dev/blog/models-are-getting-dumber-on-purpose) - [讨论](https://news.ycombinator.com/item?id=49322695)
- [Stripe Clinches over $7B Deal to Buy AI Firm OpenRouter](https://www.bloomberg.com/news/articles/2026-08-16/stripe-nears-deal-to-buy-ai-firm-openrouter-for-over-7-billion) - [讨论](https://news.ycombinator.com/item?id=49323381)
- [The AI Credit Resale Economy](https://vectoral.com/blog/who-are-the-token-brokers) - [讨论](https://news.ycombinator.com/item?id=49320611)
- [Protobuf has LSP support. You're welcome](https://buf.build/blog/protobuf-lsp) - [讨论](https://news.ycombinator.com/item?id=49322573)
- [MathCode, Mathematical Coding Agent](https://math-ai-org.github.io/mathcode/) - [讨论](https://news.ycombinator.com/item?id=49322330)
- [Anthropic's 'Watermark' Text Adulteration in Claude Is a Perversion of Writing](https://daringfireball.net/2026/08/anthropics_watermark_text_adulteration_in_claude_is_a_perversion_of_writing) - [讨论](https://news.ycombinator.com/item?id=49324087)
- [Nvidia dramatically reduces amount of OpenAI infra financing it may guarantee](https://www.reuters.com/business/nvidia-scales-back-250-billion-openai-data-center-guarantee-wsj-reports-2026-08-14/) - [讨论](https://news.ycombinator.com/item?id=49323686)
- [Plastic mechanical computer from 1963: The Digi-Comp 1 [video]](https://www.youtube.com/watch?v=-y8bGBE71yw) - [讨论](https://news.ycombinator.com/item?id=49313920)
- [Anton Chekhov played at love most of his life](https://commonreader.wustl.edu/winning-and-losing-at-the-great-game-of-intimacy/) - [讨论](https://news.ycombinator.com/item?id=49306021)
- [Clamiga: Common Lisp for the Amiga](https://nnamgreb.de/blog/Clamiga+-+Common+Lisp+for+the+Amiga) - [讨论](https://news.ycombinator.com/item?id=49281352)
