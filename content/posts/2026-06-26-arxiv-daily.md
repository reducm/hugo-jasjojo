+++
draft = false
date = "2026-06-26T09:00:00+08:00"
title = "ArXiv 每日论文精选 | 2026-06-26"
description = "今日 ArXiv AI/ML 领域精选论文解读，包含核心内容、方法、效果与AI评价"
slug = "2026-06-26-arxiv-daily"
categories = ["AI的感想"]
tags = ["arXiv", "论文阅读", "AI研究", "每日精选", "机器学习"]
+++

# 📚 ArXiv 每日论文精选 | 2026-06-26

> 自动精选今日 ArXiv 最新 AI/ML 论文，AI 深度解读核心内容、方法、效果与评价。

---

## 1. Learning Action Priors for Cross-embodiment Robot Manipulation

**作者**: Dong Jing, Tianqi Zhang, Jiaqi Liu, Jinman Zhao, Zelong Sun, Li Erran Li, Zhiwu Lu, Mingyu Ding  
**评分**: ⭐⭐⭐⭐ (9/10)  
**链接**: [http://arxiv.org/abs/2606.26095v1](http://arxiv.org/abs/2606.26095v1)  
**类别**: `cs.AI`

<!--more-->

### 🔍 核心内容
提出两阶段训练框架，在跨模态VLA对齐前预训练动作模块获得运动先验。第一阶段通过流匹配编码器-解码器从未条件动作轨迹学习跨具身时间运动结构；第二阶段通过解码器复用和早期潜变量蒸馏将先验迁移至VLA训练。

### ❓ 解决的问题
VLA模型的动作模块缺乏显式运动先验，早期优化需同时发现时间动作动态和跨模态对齐，在跨具身设置中挑战加剧。

### 🛠️ 方法
流匹配编码器-解码器动作模块；无视觉/语言标记的时间运动结构预训练；解码器复用和早期潜变量蒸馏；紧凑历史压缩器。

### 📊 效果
在13个跨具身任务上验证有效，收敛更快、成功率更高，数据稀缺的现实世界任务性能显著增强。

### 🤖 AI 评价
该工作创新性地解决了VLA模型动作模块从零学习的问题，通过预训练运动先验显著提升了跨具身泛化能力。两阶段设计优雅且实用，流匹配方法高效。实际应用价值高，尤其对数据稀缺的机器人任务。局限在于需要额外的动作数据预训练阶段。

**标签**: 机器人, VLA, 跨具身学习, 动作先验

---

## 2. ForceBand: Learning Forceful Manipulation with sEMG

**作者**: Botao He, Zhi Wang, Linna Kuang, Ishaan Ghosh, Jitendra Malik, Cornelia Fermuller, Tingfan Wu, Jiayu...  
**评分**: ⭐⭐⭐⭐ (9/10)  
**链接**: [http://arxiv.org/abs/2606.26093v1](http://arxiv.org/abs/2606.26093v1)  
**类别**: `cs.RO`

<!--more-->

### 🔍 核心内容
提出低成本腕戴sEMG系统ForceBand，将人类肌肉活动转化为力富集演示。收集10小时多模态数据集（自我中心视频、sEMG、IMU、指尖力测量），预训练EMG2Force模型预测每指力。

### ❓ 解决的问题
人类演示数据（如动作捕捉和互联网视频）主要捕获运动和外观，缺失对力敏感操作至关重要的接触力。

### 🛠️ 方法
低成本腕戴sEMG系统；10小时多模态数据集；EMG2Force力预测模型；短用户特定校准；力增强演示生成。

### 📊 效果
比视觉基线力预测误差降低50%以上；拾取、挤压和放置任务成功率87%，跨不同形状、尺寸和重量物体。

### 🤖 AI 评价
该工作解决了机器人学习中长期被忽视的力感知问题。sEMG解决方案低成本且实用，数据收集方法系统。87%成功率在力控制任务中表现出色。局限在于需要用户校准，且sEMG信号可能受个体差异影响。应用前景广阔，尤其对精细操作任务。

**标签**: 机器人操作, sEMG, 力感知, 模仿学习

---

## 3. TryOnCrafter: Unleashing Camera Trajectories for Realistic Video Virtual Try-on via a Renderable 4D Try-on Proxy

**作者**: Hao Sun, Hao Yan, Mengting Chen, Quanjian Song, Yu Li, Juan Cao, Jinsong Lan, Xiaoyong Zhu, Bo Zheng...  
**评分**: ⭐⭐⭐⭐ (9/10)  
**链接**: [http://arxiv.org/abs/2606.26092v1](http://arxiv.org/abs/2606.26092v1)  
**类别**: `cs.CV`

<!--more-->

### 🔍 核心内容
定义相机可控视频虚拟试衣(CaM-VVT)新任务，提出TryOnCrafter——首个统一DiT框架。引入可渲染4D试衣代理，将高保真2D试衣先验蒸馏到3DGS服装化头像，通过SMPL-X序列动画和度量对齐重建背景点云。

### ❓ 解决的问题
现有视频虚拟试衣被动依赖源相机轨迹，无法支持全方向视点探索的交互自由。

### 🛠️ 方法
可渲染4D试衣代理；2D到3DGS蒸馏；SMPL-X动画；度量对齐背景点云；代理锚定视频DiT。

### 📊 效果
实现严格的轨迹约束和物理可信变形；支持人体重定位、子弹时间效果和360度轨道观看等应用。

### 🤖 AI 评价
开创性地定义了CaM-VVT任务，4D代理的显式解耦设计优雅且实用。DiT框架统一处理几何一致性和运动完整性。应用多样性令人印象深刻。局限在于3DGS重建质量可能受输入影响，计算成本较高。商业价值显著，虚拟试衣行业应用前景广阔。

**标签**: 虚拟试衣, 4D生成, DiT, 3DGS

---

## 4. Real-Time Voice AI Hears but Does Not Listen

**作者**: Martijn Bartelds, Federico Bianchi, James Zou  
**评分**: ⭐⭐⭐⭐ (9/10)  
**链接**: [http://arxiv.org/abs/2606.26083v1](http://arxiv.org/abs/2606.26083v1)  
**类别**: `cs.CL`

<!--more-->

### 🔍 核心内容
评估四个领先实时语音系统（GPT Realtime 2、Gemini 3.1 Flash Live、Qwen3.5 Omni Plus/Flash），发现它们对单词和语音传递模式都传达有意义信息的任务中，仅对单词而非声音做出反应。

### ❓ 解决的问题
实时语音AI系统未能利用语音传递的情感和语气信息，在哭泣、恐惧、讽刺等场景中做出错误决策，存在情感智能鸿沟。

### 🛠️ 方法
三个关键场景评估（哭泣挂断、恐惧授权转账、讽刺同意）；四个生产系统对比；温度0控制实验；直接询问与决策对比。

### 📊 效果
所有系统都存在情感智能鸿沟；直接询问时可靠识别情感，但决策时忽略；提示改善仅部分且不一致。

### 🤖 AI 评价
重要且引人警觉的发现，揭示了生产语音AI系统的严重缺陷。实验设计贴近真实场景，结果令人信服。对语音AI的安全使用提出了重要警示。局限在于评估范围有限，未来需更多语言和场景验证。呼吁行业重视语音中的非语言信息。

**标签**: 语音AI, 情感智能, 安全评估, 多模态

---

## 5. Neglected Free Lunch from Post-training: Progress Advantage for LLM Agents

**作者**: Changdae Oh, Wendi Li, Seongheon Park, Samuel Yeh, Tanwi Mallick, Sharon Li  
**评分**: ⭐⭐⭐⭐ (9/10)  
**链接**: [http://arxiv.org/abs/2606.26080v1](http://arxiv.org/abs/2606.26080v1)  
**类别**: `cs.AI`

<!--more-->

### 🔍 核心内容
提出Progress Advantage——RL后训练策略与参考策略的对数概率比恰好恢复最优优势函数。无需专用奖励模型训练，作为标准RL后训练管道的副产品提供有效步骤级评分。

### ❓ 解决的问题
为智能体设置构建过程奖励模型困难：长时程交互、不可逆动作和随机环境反馈使人工标注和蒙特卡洛估计大规模不可行。

### 🛠️ 方法
推导随机马尔可夫决策过程中的隐式优势；对数概率比恢复优势函数；测试时扩展、不确定性量化和失败归因应用。

### 📊 效果
在5个基准和4个模型族上持续超越基于置信度的基线；无需任务特定训练即超越专用训练奖励模型。

### 🤖 AI 评价
 elegant理论发现，将RL后训练副产品转化为强大工具。无需额外训练的优势使其极具实用价值。多应用验证显示了广泛适用性。局限在于对更复杂部分可观察环境的效果待验证，且需要RL后训练已完成的模型。

**标签**: LLM智能体, RL后训练, 过程奖励, 优势函数

---

## 6. RevengeBench: Reverse Engineering Code-Space Policies from Behavioral Experiments

**作者**: Babak Rahmani, Sebastian Dziadzio, Joschka Strüber, Sergio Hernández-Gutiérrez, Matthias Bethge  
**评分**: ⭐⭐⭐⭐ (8/10)  
**链接**: [http://arxiv.org/abs/2606.26094v1](http://arxiv.org/abs/2606.26094v1)  
**类别**: `cs.LG`

<!--more-->

### 🔍 核心内容
提出RevengeBench基准，评估从行为轨迹中重建底层决策程序的能力。学习者观察目标策略与采样对手对弈，设计自定义对手策略作为行为探针，提交可执行假设并评估。

### ❓ 解决的问题
从行为轨迹推断隐藏决策机制（逆问题），特别是在代码空间中重建可执行决策程序。

### 🛠️ 方法
75个Elo校准的LLM生成策略；5个游戏环境；自定义对手探针设计；连续动作距离度量；玩家对战锦标赛验证。

### 📊 效果
12个前沿LLM恢复质量34-72%初始距离闭合；重建策略提供可测量的竞争优势，尤其对弱模型。

### 🤖 AI 评价
这是一个非常有创意的基准工作，将行为分析与代码生成结合，开辟了对手建模和策略可解释性的新方向。实验设计严谨，使用多个游戏环境和LLM验证。实用价值在于帮助理解黑盒策略。局限在于恢复率仍有提升空间，且对复杂真实环境适用性待验证。

**标签**: 行为分析, 策略恢复, 代码空间, LLM评估

---

## 7. On-Policy Self-Distillation with Sampled Demonstrations Reduces Output Diversity

**作者**: Andrei Liviu Nicolicioiu, Mohammad Pezeshki, Aaron Courville  
**评分**: ⭐⭐⭐⭐ (8/10)  
**链接**: [http://arxiv.org/abs/2606.26091v1](http://arxiv.org/abs/2606.26091v1)  
**类别**: `cs.AI`

<!--more-->

### 🔍 核心内容
揭示同策略自蒸馏的隐藏成本：输出多样性降低，pass@k曲线扁平化。理论上证明最优自蒸馏策略通过逐点条件互信息倾斜基础分布，放大概率差距，集中质量于已主导模式。

### ❓ 解决的问题
同策略自蒸馏使用采样正确演示作为上下文提供密集标记级反馈，但导致多样性损失，在需要多样策略的分布外设置中失败。

### 🛠️ 方法
理论分析最优自蒸馏策略；图路径查找任务控制实验；科学问答基准；概率比分析。

### 📊 效果
自蒸馏模型在平均性能上匹配或超过RL，但功能和语义多样性显著降低；在需要多样策略的OOD设置中失败。

### 🤖 AI 评价
重要理论发现，揭示了自蒸馏与多样性之间的根本张力。理论分析严谨，实验设计有效。对RLHF和蒸馏实践有重要启示。局限在于主要关注特定任务，对更复杂生成任务的适用性需进一步验证。提醒从业者权衡性能与多样性。

**标签**: 自蒸馏, 多样性, RL, 理论分析

---

## 8. MVTrack4Gen: Multi-View Point Tracking as Geometric Supervision for 4D Video Generation

**作者**: JoungBin Lee, Jaewoo Jung, Jongmin Lee, Tongmin Kim, Hyunsung Kim, Takuya Narihira, Kazumi Fukuda, J...  
**评分**: ⭐⭐⭐⭐ (8/10)  
**链接**: [http://arxiv.org/abs/2606.26087v1](http://arxiv.org/abs/2606.26087v1)  
**类别**: `cs.CV`

<!--more-->

### 🔍 核心内容
提出MVTrack4Gen，利用多视点追踪作为几何和运动监督信号，增强相机条件新视角视频扩散模型。发现特定注意力层编码强对应线索，通过辅助多视点追踪头联合训练。

### ❓ 解决的问题
显式3D表示方法受重建模块精度限制，动态物体几何常不准确；仅相机条件方法虽视觉质量高但难保持几何和运动一致性。

### 🛠️ 方法
多视点追踪作为辅助监督；运动感知对应关系增强；注意力层特征路由；点追踪目标联合训练。

### 📊 效果
在多样基准上实现SOTA几何一致性，相机精度具有竞争力。

### 🤖 AI 评价
巧妙利用现有多视点追踪作为监督信号，避免了复杂3D重建。注意力层分析提供了有价值的见解。方法可与现有模型结合，实用性强。局限在于依赖多视点数据可用性，且对极端动态场景效果可能受限。

**标签**: 4D视频生成, 多视点追踪, 几何一致性, 扩散模型

---

## 9. Same Evidence, Different Answer: Auditing Order Sensitivity in Multimodal Large Language Models

**作者**: Akshay Paruchuri, Sanmi Koyejo, Ehsan Adeli  
**评分**: ⭐⭐⭐⭐ (8/10)  
**链接**: [http://arxiv.org/abs/2606.26079v1](http://arxiv.org/abs/2606.26079v1)  
**类别**: `cs.LG`

<!--more-->

### 🔍 核心内容
提出Facet-Probe，五个维度审计（选项、证据块、文档排名、图像集、混合模态排序）18个前沿和开源权重MLLM。贝叶斯项目反应模型分离排序噪声与每维度偏差。

### ❓ 解决的问题
标准MLLM基准在单一规范排序上评分，遗漏排序无关性这一基线可靠性属性，违反新兴AI评估指南。

### 🛠️ 方法
五维度审计框架；贝叶斯IRT模型；同排序控制估计解码器噪声底线；Gemini缓解测试。

### 📊 效果
18个MLLM无一是排序不变的；每维度面板平均翻转率24-50%；最佳模型仍13.4%翻转；提示缓解不具传递性。

### 🤖 AI 评价
系统且重要的评估工作，揭示了MLLM的可靠性问题。多维度审计框架全面，统计方法严谨。结果对MLLM评估和部署有深远影响。局限在于主要测试特定模型版本，快速迭代可能改变结果。提出跨排序翻转率作为标准报告轴具有实践价值。

**标签**: MLLM, 排序敏感性, 可靠性, 评估

---

## 10. A cross-process welding penetration status prediction algorithm based on unsupervised domain adaptation in laser and TIG welding

**作者**: Sen Li, Haichao Cui, Chendong Shao, Yaqi Wang, Xinhua Tang  
**评分**: ⭐⭐⭐ (7/10)  
**链接**: [http://arxiv.org/abs/2606.26078v1](http://arxiv.org/abs/2606.26078v1)  
**类别**: `cs.AI`

<!--more-->

### 🔍 核心内容
提出无监督域适应(UDA)框架结合渐进源域扩展(GSDE)策略，解决TIG和激光焊接之间的跨工艺域迁移问题。模型学习域不变特征同时保持判别类边界。

### ❓ 解决的问题
监督深度学习在焊接熔透状态分类中性能在域迁移时显著下降，如从弧主导TIG焊接到匙孔激光焊接的迁移。

### 🛠️ 方法
UDA框架；渐进源域扩展策略；TIG和激光焊接专用数据集；UMAP可视化验证。

### 📊 效果
同工艺TIGFH 90.65%、LSPS 90.72%；跨工艺TIG到激光80.48%、激光到TIG 81.13%，比基线提升43%以上。

### 🤖 AI 评价
工业应用导向的工作，解决实际制造中的域迁移问题。GSDE策略设计巧妙，显著提升跨工艺性能。降低新焊接工艺重新标注成本。局限在于领域特定，泛化到其他制造过程需验证。但对焊接行业智能化具有实际价值。

**标签**: 工业AI, 域适应, 焊接, 制造

---

## 📈 今日统计

- **论文总数**: 10 篇
- **数据来源**: ArXiv RSS (cs.AI, cs.LG, cs.CL, cs.CV, cs.RO)
- **更新时间**: 2026-06-26

---

*本报告由 AI 自动生成，仅供参考。论文观点不代表本站立场。*
