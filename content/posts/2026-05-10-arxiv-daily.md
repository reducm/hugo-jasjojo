+++
draft = false
date = "2026-05-10T09:00:00+08:00"
title = "ArXiv 每日论文精选 | 2026-05-10"
description = "今日 ArXiv AI/ML 领域精选论文解读，包含核心内容、方法、效果与AI评价"
slug = "2026-05-10-arxiv-daily"
categories = ["AI的感想"]
tags = ["arXiv", "论文阅读", "AI研究", "每日精选", "机器学习"]
+++

# 📚 ArXiv 每日论文精选 | 2026-05-10

> 自动精选今日 ArXiv 最新 AI/ML 论文，AI 深度解读核心内容、方法、效果与评价。

---

## 1. EMO: Pretraining Mixture of Experts for Emergent Modularity

**作者**: Ryan Wang, Akshita Bhagia, Sewon Min  
**评分**: ⭐⭐⭐⭐ (9/10)  
**链接**: [http://arxiv.org/abs/2605.06663v1](http://arxiv.org/abs/2605.06663v1)  
**类别**: `cs.CL`

<!--more-->

### 🔍 核心内容
提出EMO架构，通过文档边界约束实现专家 emergent modularity（涌现模块化），使MoE能够在仅使用25%专家时仅下降1%性能，支持模块化部署和组合。

### ❓ 解决的问题
标准MoE在推理时限制使用子集专家会导致严重性能下降，无法实现真正的模块化部署；标准MoE专家仅在低层语法层面特化而非语义层面。

### 🛠️ 方法
核心思想是鼓励相似领域的token使用相似专家；约束同一文档内的token从共享池中选择专家，不同文档可使用不同池；仅用文档边界作为先验，无需人工定义领域。

### 📊 效果
1B活跃/14B总参数模型在1T tokens上预训练，完整模型性能匹配标准MoE；仅保留25%（12.5%）专家时绝对下降仅1%（3%），而标准MoE在此设置下完全失效；专家在语义层面（数学、代码等）特化。

### 🤖 AI 评价
这是MoE领域的重要突破，真正实现了模块化部署的愿景。仅用文档边界作为约束非常巧妙，避免了人工先验。语义层面的专家特化比语法特化更有实际意义。对内存受限场景和大模型部署具有重大价值。FrontierMath 48%的SOTA成绩也令人印象深刻。

**标签**: MoE, 模块化, 专家特化, 大模型部署, 语义理解

---

## 2. ActCam: Zero-Shot Joint Camera and 3D Motion Control for Video Generation

**作者**: Omar El Khalifi, Thomas Rossi, Oscar Fossey, Thibault Fouque, Ulysse Mizrahi, Philip Torr, Ivan Lapt...  
**评分**: ⭐⭐⭐⭐ (8/10)  
**链接**: [http://arxiv.org/abs/2605.06667v1](http://arxiv.org/abs/2605.06667v1)  
**类别**: `cs.AI`

<!--more-->

### 🔍 核心内容
提出ActCam方法，实现零样本联合相机和3D动作控制的视频生成。通过驱动视频将角色动作迁移到新场景，并支持逐帧控制内外相机参数，无需训练即可实现精细的摄影和表演控制。

### ❓ 解决的问题
现有视频生成难以同时控制演员动作和相机轨迹，艺术应用需要精细的表演和摄影控制，而现有方法通常只能控制其中一方面。

### 🛠️ 方法
基于预训练的图生视频扩散模型，利用场景深度和角色姿态作为条件；生成跨帧几何一致的姿态和深度条件；采用两阶段条件调度——早期去噪同时使用姿态和稀疏深度约束场景结构，后期丢弃深度仅保留姿态指导。

### 📊 效果
在多个基准测试上改善了相机遵循度和动作保真度，人工评估中更受偏好，尤其在大视角变化场景下表现突出。

### 🤖 AI 评价
创新性很强，首次实现了零样本联合相机和动作控制。两阶段调度策略设计巧妙，避免了过度约束。无需训练是其最大优势，实用价值高。不足之处在于依赖于现有扩散模型作为基础，对模型能力有一定要求。

**标签**: 视频生成, 零样本学习, 相机控制, 动作迁移, 扩散模型

---

## 3. UniPool: A Globally Shared Expert Pool for Mixture-of-Experts

**作者**: Minbin Huang, Han Shi, Chuanyang Zheng, Yimeng Wu, Guoxuan Chen, Xintong Yu, Yichun Yin, Hong Cheng  
**评分**: ⭐⭐⭐⭐ (8/10)  
**链接**: [http://arxiv.org/abs/2605.06665v1](http://arxiv.org/abs/2605.06665v1)  
**类别**: `cs.AI`

<!--more-->

### 🔍 核心内容
提出UniPool架构，用全局共享专家池替代传统MoE中每层独立的专家集合。通过池级辅助损失和NormRouter实现稳定训练，证明专家参数可以亚线性增长而非随深度线性增长。

### ❓ 解决的问题
传统MoE每层拥有独立专家集合，导致深度扩展时专家参数量线性增长，且深层路由存在冗余（随机路由仅降1-1.6点精度），造成参数效率低下。

### 🛠️ 方法
用单一共享专家池替代每层独立专家；引入池级辅助损失平衡全局专家利用率；采用NormRouter实现稀疏且尺度稳定的路由；在5个LLaMA架构规模上验证。

### 📊 效果
在30B tokens训练后，UniPool持续降低验证损失（最多0.0386）；使用41.6%-66.7%专家参数即可匹配或超越层-wise MoE；池大小成为显式的深度缩放超参数。

### 🤖 AI 评价
对传统MoE架构提出了根本性改进，共享池设计大幅提升了参数效率。实验规模覆盖全面（182M-978M），结论可靠。发现专家参数可亚线性增长是重要的理论贡献。与细粒度专家分解的正交互效应展示了良好的扩展性。

**标签**: MoE, 专家混合, 参数效率, LLM架构, 路由优化

---

## 4. Relit-LiVE: Relight Video by Jointly Learning Environment Video

**作者**: Weiqing Xiao, Hong Li, Xiuyu Yang, Houyuan Chen, Wenyi Li, Tianqi Liu, Shaocong Xu, Chongjie Ye, Hao...  
**评分**: ⭐⭐⭐⭐ (8/10)  
**链接**: [http://arxiv.org/abs/2605.06658v1](http://arxiv.org/abs/2605.06658v1)  
**类别**: `cs.CV`

<!--more-->

### 🔍 核心内容
提出Relit-LiVE视频重光照框架，通过引入原始参考图像和联合学习环境视频表示，无需相机姿态先验即可生成物理一致、时序稳定的重光照视频，支持动态光照和相机运动。

### ❓ 解决的问题
现有视频重光照依赖本征分解，但真实视频的本征分解不可靠，导致扭曲外观、材质破坏和时序伪影累积；且通常需要已知每帧相机姿态。

### 🛠️ 方法
将原始参考图像显式引入渲染过程恢复丢失的场景线索；提出环境视频预测范式，在单一扩散过程中同时生成重光照视频和每帧环境贴图；实现几何-光照强对齐。

### 📊 效果
在合成和真实世界基准上持续超越SOTA视频重光照和神经渲染方法；支持场景级渲染、材质编辑、物体插入、流式视频重光照等下游应用。

### 🤖 AI 评价
解决了视频重光照的核心痛点——本征分解不可靠问题。联合预测设计巧妙，物理一致性显著提升。无需相机姿态先验大大降低了实际应用门槛。下游应用多样性展示了良好的扩展性。对影视后期和虚拟制作有重要价值。

**标签**: 视频重光照, 神经渲染, 物理一致性, 环境贴图, 扩散模型

---

## 5. Why Global LLM Leaderboards Are Misleading: Small Portfolios for Heterogeneous Supervised ML

**作者**: Jai Moondra, Ayela Chughtai, Bhargavi Lanka, Swati Gupta  
**评分**: ⭐⭐⭐⭐ (8/10)  
**链接**: [http://arxiv.org/abs/2605.06656v1](http://arxiv.org/abs/2605.06656v1)  
**类别**: `cs.LG`

<!--more-->

### 🔍 核心内容
通过分析~89K条比较数据，证明全局Bradley-Terry排名具有误导性——近2/3的决定性投票相互抵消，前50模型统计上不可区分。提出(λ,ν)-portfolios框架，用少量模型组合覆盖异构用户需求。

### ❓ 解决的问题
当前LLM排行榜基于全局BT排名，忽略了用户偏好的强异构性（语言、任务、时间差异），导致排名噪音大、区分度低，无法有效指导模型选择。

### 🛠️ 方法
分析Arena数据揭示投票异质性结构；发现语言是组织子群体的关键维度；提出(λ,ν)-portfolios框架——小模型集合以最多λ误差覆盖至少ν比例用户；用集合覆盖变体求解。

### 📊 效果
5个BT排名覆盖96%投票（全局排名仅21%）；6模型组合覆盖投票数是全局top-6的两倍；语言分组使ELO分数扩散提升两个数量级。

### 🤖 AI 评价
对LLM评估范式提出了深刻挑战，数据分析扎实有力。portfolios概念为异构场景下的模型部署提供了实用框架。对政策制定者和模型部署者有重要参考价值。COMPAS数据集上的公平性应用展示了跨领域潜力。结论可能引发评估社区的方法论反思。

**标签**: LLM评估, 排行榜, 异构偏好, 模型选择, Bradley-Terry

---

## 6. AI Co-Mathematician: Accelerating Mathematicians with Agentic AI

**作者**: Daniel Zheng, Ingrid von Glehn, Yori Zwols, Iuliya Beloshapka, Lars Buesing, Daniel M. Roy, Martin W...  
**评分**: ⭐⭐⭐⭐ (8/10)  
**链接**: [http://arxiv.org/abs/2605.06651v1](http://arxiv.org/abs/2605.06651v1)  
**类别**: `cs.AI`

<!--more-->

### 🔍 核心内容
提出AI Co-Mathematician工作台，为数学家提供交互式AI agent支持开放研究，涵盖构思、文献检索、计算探索、定理证明和理论构建。异步状态化工作空间管理不确定性、追踪失败假设，并输出原生数学产物。

### ❓ 解决的问题
数学研究高度迭代和探索性，现有AI工具缺乏对数学工作流全流程的 holistic 支持，难以处理不确定性、追踪失败尝试、生成可发表的数学产物。

### 🛠️ 方法
设计异步状态化工作空间；管理不确定性并细化用户意图；追踪失败假设；输出原生数学产物（定理、证明等）；集成多agent协同支持全流程。

### 📊 效果
帮助研究人员解决开放问题、识别新方向、发现被忽视的文献；在FrontierMath Tier 4上达到48%，为所有AI系统的新高分。

### 🤖 AI 评价
对AI辅助数学研究范式有重要推动作用。异步状态化设计和失败假设追踪非常契合真实数学研究流程。48%的FrontierMath成绩令人印象深刻。作为工作台而非单一工具，生态位定位准确。早期测试阶段，大规模实际应用的稳定性和覆盖范围有待观察。

**标签**: AI数学家, Agent, 定理证明, FrontierMath, 研究辅助

---

## 7. BAMI: Training-Free Bias Mitigation in GUI Grounding

**作者**: Borui Zhang, Bo Zhang, Bo Wang, Wenzhao Zheng, Yuhao Cheng, Liang Tang, Yiqiang Yan, Jie Zhou, Jiwen...  
**评分**: ⭐⭐⭐ (7/10)  
**链接**: [http://arxiv.org/abs/2605.06664v1](http://arxiv.org/abs/2605.06664v1)  
**类别**: `cs.AI`

<!--more-->

### 🔍 核心内容
提出BAMI方法，通过粗到细聚焦和候选选择两种操作，在无需训练的情况下缓解GUI定位中的精度偏差和模糊性偏差，显著提升GUI agent的定位精度。

### ❓ 解决的问题
GUI grounding在复杂场景（如ScreenSpot-Pro）中表现不佳，主要误差来源为高分辨率导致的精度偏差和复杂界面元素导致的模糊性偏差。

### 🛠️ 方法
提出MPD归因方法定位误差源；引入Bias-Aware Manipulation Inference，包含粗到细聚焦（解决精度偏差）和候选选择（解决模糊性偏差）两种训练无关的推理时操作。

### 📊 效果
在ScreenSpot-Pro上，将TianXi-Action-7B模型准确率从51.9%提升至57.8%；消融实验验证了在不同参数配置下的鲁棒性。

### 🤖 AI 评价
训练无关的改进非常有实用价值，可直接应用于现有模型而无需重新训练。归因分析清晰定位了问题根源，方法设计针对性强。提升幅度显著，但绝对准确率仍有较大提升空间。适合作为即插即用的推理增强模块。

**标签**: GUI Agent, 定位偏差, 训练无关, 推理增强, 界面理解

---

## 8. Verifier-Backed Hard Problem Generation for Mathematical Reasoning

**作者**: Yuhang Lai, Jiazhan Feng, Yee Whye Teh, Ning Miao  
**评分**: ⭐⭐⭐ (7/10)  
**链接**: [http://arxiv.org/abs/2605.06660v1](http://arxiv.org/abs/2605.06660v1)  
**类别**: `cs.AI`

<!--more-->

### 🔍 核心内容
提出VHG框架，通过引入独立验证器的三方博弈机制，生成有效、有挑战性且新颖的数学问题，避免奖励黑客攻击，用于提升LLM训练数据和自主科研能力。

### ❓ 解决的问题
LLM擅长解题但难以生成有效且有挑战性的新问题；现有方法依赖昂贵的人工专家或简单的自博弈范式，后者常因奖励黑客产生无效问题。

### 🛠️ 方法
构建setter-solver-verifier三方博弈；setter的奖励由验证器评估的问题有效性和solver评估的问题难度共同决定；实例化Hard符号验证器和Soft LLM验证器两种变体。

### 📊 效果
在不定时积分和一般数学推理任务上，VHG显著超越所有基线方法。

### 🤖 AI 评价
三方博弈设计是核心创新，独立验证器有效解决了奖励黑客问题。对LLM训练数据生成和自主科研具有重要意义。实验在两个任务上验证，但范围可以进一步扩大。符号验证器和LLM验证器的对比分析有价值。

**标签**: 数学推理, 问题生成, LLM训练, 验证器, 自博弈

---

## 9. Optimizer-Model Consistency: Full Finetuning with the Same Optimizer as Pretraining Forgets Less

**作者**: Yuxing Liu, Jianyu Wang, Tong Zhang  
**评分**: ⭐⭐⭐ (7/10)  
**链接**: [http://arxiv.org/abs/2605.06654v1](http://arxiv.org/abs/2605.06654v1)  
**类别**: `cs.AI`

<!--more-->

### 🔍 核心内容
发现使用与预训练相同优化器进行全量微调，能在学习新任务的同时减少遗忘，优于其他优化器甚至LoRA。通过理论和实验揭示优化器对模型激活的正则化效应及其与权重更新结构的交互。

### ❓ 解决的问题
全量微调常面临灾难性遗忘问题，而LoRA虽减少遗忘但表达能力受限；优化器选择对微调效果的影响未被充分理解。

### 🛠️ 方法
控制实验对比相同/不同优化器的微调效果；理论分析优化器对激活的正则化效应；分析权重更新应遵循的特定结构以降低遗忘；对比Muon和AdamW在推理任务上的表现差异。

### 📊 效果
相同优化器全量微调实现更好的学习-遗忘权衡；Muon在推理任务微调上表现差于AdamW；合成语言建模实验证明Muon倾向于死记硬背，损害少量数据下的模式获取。

### 🤖 AI 评价
挑战了LoRA必然优于全量微调的常见认知，提供了优化器选择的新视角。理论分析（正则化效应、权重更新结构）有深度。对实际微调工作有直接指导意义。但实验主要在SFT阶段，其他阶段的适用性有待验证。

**标签**: 全量微调, 灾难性遗忘, 优化器, LoRA, LLM训练

---

## 10. When No Benchmark Exists: Validating Comparative LLM Safety Scoring Without Ground-Truth Labels

**作者**: Sushant Gautam, Finn Schwall, Annika Willoch Olstad, Fernando Vallecillos Ruiz, Birk Torpmann-Hagen,...  
**评分**: ⭐⭐⭐ (7/10)  
**链接**: [http://arxiv.org/abs/2605.06652v1](http://arxiv.org/abs/2605.06652v1)  
**类别**: `cs.AI`

<!--more-->

### 🔍 核心内容
提出benchmarkless comparative safety scoring框架，通过工具链验证（安全vs消融对比响应性、目标方差主导性、重跑稳定性）实现无标注场景下的LLM安全比较评估，并在挪威安全包上验证。

### ❓ 解决的问题
许多部署场景需要在相关语言、行业或监管体制尚无标注基准时比较候选LLM的安全性，传统依赖标注数据的评估方法无法适用。

### 🛠️ 方法
形式化无基准比较安全评分设定；提出instrumental-validity chain：安全vs消融AUROC、目标驱动方差主导性(η²≈0.52)、十次重跑稳定性；实现SimpleAudit本地优先评分工具。

### 📊 效果
安全与消融目标AUROC达0.89-1.00；目标身份是主导方差成分；严重程度分布十次重跑稳定；挪威公共部门案例证明更安全模型取决于场景类别和风险度量。

### 🤖 AI 评价
对安全评估的实际部署需求响应精准，框架设计严谨。instrumental-validity chain为无标注评估提供了可信路径。挪威案例展示了实际应用价值。强调必须报告完整上下文而非单一排名的观点非常重要。局限性在于工具链本身不保证部署适配性，需要在上游解决。

**标签**: LLM安全, 无基准评估, 审计框架, 挪威语, 模型比较

---

## 📈 今日统计

- **论文总数**: 10 篇
- **数据来源**: ArXiv RSS (cs.AI, cs.LG, cs.CL, cs.CV, cs.RO)
- **更新时间**: 2026-05-10

---

*本报告由 AI 自动生成，仅供参考。论文观点不代表本站立场。*
