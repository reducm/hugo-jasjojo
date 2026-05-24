+++
draft = false
date = "2026-05-24T09:00:00+08:00"
title = "ArXiv 每日论文精选 | 2026-05-24"
description = "今日 ArXiv AI/ML 领域精选论文解读，包含核心内容、方法、效果与AI评价"
slug = "2026-05-24-arxiv-daily"
categories = ["AI的感想"]
tags = ["arXiv", "论文阅读", "AI研究", "每日精选", "机器学习"]
+++

# 📚 ArXiv 每日论文精选 | 2026-05-24

> 自动精选今日 ArXiv 最新 AI/ML 论文，AI 深度解读核心内容、方法、效果与评价。

---

## 1. Which Way Did It Move? Diagnosing and Overcoming Directional Motion Blindness in Video-LLMs

**作者**: Jongseo Lee, Hyuntak Lee, Sunghun Kim, Sooa Kim, Jihoon Chung, Jinwoo Choi  
**评分**: ⭐⭐⭐⭐ (9/10)  
**链接**: [http://arxiv.org/abs/2605.22823v1](http://arxiv.org/abs/2605.22823v1)  
**类别**: `cs.CV`

<!--more-->

### 🔍 核心内容
发现Video-LLMs存在方向性运动盲视问题——即使能感知运动方向，也无法将其正确绑定到语言答案。提出DeltaDirect诊断方法和MoDirect数据集，通过投影仪层级目标函数预测归一化2D运动向量。

### ❓ 解决的问题
大多数Video-LLMs在判断物体左右上下运动方向时表现接近随机，存在方向绑定缺口，视觉复杂度削弱信号幅度并限制泛化。

### 🛠️ 方法
1) 追踪运动方向信息在Video-LLM各阶段的流动定位失败点；2) 提出DeltaDirect投影仪层级目标函数；3) 构建MoDirect合成与真实基准数据集。

### 📊 效果
在MoDirect-SynBench上准确率从25.9%提升至85.4%；在真实世界数据上提升21.9个百分点，且不影响标准视频理解性能。

### 🤖 AI 评价
诊断型研究的典范。不仅发现问题，还精确定位到方向绑定缺口这一具体机制。DeltaDirect的设计简洁而有效，合成到真实的泛化路径清晰。代码已开源，实用性强。评分：9/10

**标签**: Video-LLM, Motion Understanding, Multimodal, Vision-Language

---

## 2. Cambrian-P: Pose-Grounded Video Understanding

**作者**: Jihan Yang, Zifan Zhao, Xichen Pan, Shusheng Yang, Junyi Zhang, Bingyi Kang, Hu Xu, Saining Xie  
**评分**: ⭐⭐⭐⭐ (9/10)  
**链接**: [http://arxiv.org/abs/2605.22819v1](http://arxiv.org/abs/2605.22819v1)  
**类别**: `cs.CV`

<!--more-->

### 🔍 核心内容
提出Cambrian-P视频多模态大模型，引入可学习的每帧相机token和位姿回归头，将相机位姿作为轻量级监督信号用于视频理解，实现空间推理和位姿估计的双重提升。

### ❓ 解决的问题
现有MLLMs将视频帧作为孤立的2D快照处理，忽略了相机位姿提供的跨帧共享空间坐标框架，导致空间推理能力不足。

### 🛠️ 方法
1) 每帧可学习相机token；2) 位姿回归头；3) 精心设计的采样方案；4) 在野生视频上进行伪标注位姿训练。

### 📊 效果
在VSI-Bench空间推理基准上提升4.5-6.5%，泛化到8个额外基准，在ScanNet流式位姿估计上达到SOTA；野生视频训练还提升了通用视频QA。

### 🤖 AI 评价
位姿作为基础信号的观点很有洞察力。设计简洁——只需添加相机token和回归头，就能带来广泛提升。野生视频伪标注的扩展路径尤其令人印象深刻，显示了方法的实用性和可扩展性。评分：9/10

**标签**: Video Understanding, Camera Pose, Spatial Reasoning, MLLM

---

## 3. Vector Policy Optimization: Training for Diversity Improves Test-Time Search

**作者**: Ryan Bahlous-Boldi, Isha Puri, Idan Shenfeld, Akarsh Kumar, Mehul Damani, Sebastian Risi, Omar Khatt...  
**评分**: ⭐⭐⭐⭐ (9/10)  
**链接**: [http://arxiv.org/abs/2605.22817v1](http://arxiv.org/abs/2605.22817v1)  
**类别**: `cs.AI`

<!--more-->

### 🔍 核心内容
提出Vector Policy Optimization (VPO)，一种RL算法，显式训练策略以预期多样化的下游奖励函数并产生多样化解决方案。VPO本质上是GRPO优势估计器的直接替代品，但训练LLM输出在向量奖励空间中针对不同权衡专业化的解决方案集。

### ❓ 解决的问题
标准LLM后训练优化预指定的标量奖励，导致低熵响应分布，难以满足推理时搜索所需的多样性。

### 🛠️ 方法
利用奖励在实践中通常是向量值的特点（如代码生成的逐测试用例正确性），训练策略在向量奖励空间的不同权衡点上专业化。

### 📊 效果
在四项任务上，VPO在测试时搜索（pass@k、best@k）上匹配或超越最强标量RL基线，搜索预算越大优势越明显；在进化搜索中解锁了GRPO完全无法解决的问题。

### 🤖 AI 评价
洞察深刻：多样性不应是副产品，而应是训练目标本身。VPO作为GRPO的直接替代品降低了采用门槛。随着测试时搜索成为标准范式，这一方向极具前瞻性。实验覆盖了代码生成、进化搜索等多样化场景，说服力强。评分：9/10

**标签**: RL, LLM Training, Test-Time Search, Diversity

---

## 4. Remember to be Curious: Episodic Context and Persistent Worlds for 3D Exploration

**作者**: Lily Goli, Justin Kerr, Daniele Reda, Alec Jacobson, Andrea Tagliasacchi, Angjoo Kanazawa  
**评分**: ⭐⭐⭐⭐ (9/10)  
**链接**: [http://arxiv.org/abs/2605.22814v1](http://arxiv.org/abs/2605.22814v1)  
**类别**: `cs.LG`

<!--more-->

### 🔍 核心内容
证明好奇心驱动RL在复杂真实感环境中的失败源于缺乏空间持久性和情景上下文。使用在线3D重建作为持久世界模型，将智能体策略参数化为RGB观测上的序列模型以保持情景上下文，实现高效探索。

### ❓ 解决的问题
好奇心驱动RL在复杂3D环境中难以工作，智能体陷入局部循环，对遗忘状态重新访问时仍获得新鲜奖励。

### 🛠️ 方法
1) 在线3D重建作为持久世界模型；2) 序列模型参数化的策略保持情景轨迹历史；3) 部署时仅使用RGB帧导航。

### 📊 效果
在HM3D上纯好奇心训练超越RL主动建图基线，零样本泛化到Gibson和AI生成世界；在苹果采摘和图像目标导航等下游任务上超越从头训练基线。

### 🤖 AI 评价
问题归因清晰——将失败归因于空间持久性和情景上下文的缺失，而非好奇心机制本身。在线3D重建与序列模型的组合简洁有效。部署时仅使用RGB帧的实用性考虑周到。零样本泛化能力令人印象深刻。评分：9/10

**标签**: RL, Curiosity, 3D Exploration, Neural SLAM, Embodied AI

---

## 5. Tokenisation via Convex Relaxations

**作者**: Jan Tempus, Philip Whittington, Craig W. Schmidt, Dennis Komm, Tiago Pimentel  
**评分**: ⭐⭐⭐⭐ (8/10)  
**链接**: [http://arxiv.org/abs/2605.22821v1](http://arxiv.org/abs/2605.22821v1)  
**类别**: `cs.LG`

<!--more-->

### 🔍 核心内容
提出ConvexTok算法，将分词器构建重新建模为线性规划问题，使用凸优化工具求解，替代BPE和Unigram等贪婪算法。通过全局优化视角构建词汇表，而非局部最优决策。

### ❓ 解决的问题
现有分词算法（BPE、Unigram）是贪婪算法，仅做局部最优决策，未考虑整体词汇表质量，导致分词结果次优。

### 🛠️ 方法
将分词器构建形式化为线性规划，使用凸优化求解；提供下界证书来量化分词器与最优解的距离。

### 📊 效果
ConvexTok在内在分词指标和语言模型的bits-per-byte上持续提升，下游任务性能也有所改善；在常见词汇量下距最优解不足1%。

### 🤖 AI 评价
这是一个优雅的理论创新，将组合优化引入NLP基础设施层面。凸松弛提供了可解释的最优性保证，这是传统贪婪算法无法提供的。虽然下游任务提升不够显著，但对分词这一基础环节的改进具有长期价值。评分：8/10

**标签**: NLP, Tokenization, Convex Optimization, 线性规划

---

## 6. MotiMotion: Motion-Controlled Video Generation with Visual Reasoning

**作者**: Lee Hsin-Ying, Hanwen Jiang, Yiqun Mei, Jing Shi, Ming-Hsuan Yang, Zhixin Shu  
**评分**: ⭐⭐⭐⭐ (8/10)  
**链接**: [http://arxiv.org/abs/2605.22818v1](http://arxiv.org/abs/2605.22818v1)  
**类别**: `cs.CV`

<!--more-->

### 🔍 核心内容
提出MotiMotion框架，将运动控制重新定义为推理-再生成问题。利用无训练的视觉语言推理器优化主轨迹并推断合理的次运动，通过置信度感知控制方案调节引导强度。

### ❓ 解决的问题
现有运动控制视频生成模型 rigidly 遵循用户提供的稀疏、不精确、因果不完整的轨迹，导致结果不自然或不可信，常缺失次级因果后果。

### 🛠️ 方法
1) 无训练VLM推理器优化图像空间坐标；2) 幻觉合理的次运动；3) 置信度感知控制方案；4) 构建MotiBench基准测试集。

### 📊 效果
在MotiBench上，VLM评估和人类研究均显示MotiMotion产生更合理的物体行为和交互，优于现有方法。

### 🤖 AI 评价
从刚性控制转向推理增强的范式升级。VLM推理器的免训练使用很聪明，置信度感知控制解决了高质量和低质量输入的不同需求。MotiBench的构建填补了这一领域的评估空白。评分：8/10

**标签**: Video Generation, Motion Control, Visual Reasoning, VLM

---

## 7. AwareVLN: Reasoning with Self-awareness for Vision-Language Navigation

**作者**: Wenxuan Guo, Xiuwei Xu, Yichen Liu, Xiangyu Li, Hang Yin, Huangxing Chen, Wenzhao Zheng, Jianjiang F...  
**评分**: ⭐⭐⭐⭐ (8/10)  
**链接**: [http://arxiv.org/abs/2605.22816v1](http://arxiv.org/abs/2605.22816v1)  
**类别**: `cs.CV`

<!--more-->

### 🔍 核心内容
提出AwareVLN框架，赋予导航模型自我意识推理机制，使其以完全端到端和数据驱动的方式理解智能体状态和任务进度。包含结构化推理模块和带进度分割的自动数据引擎。

### ❓ 解决的问题
现有VLN方法缺乏对智能体、指令和场景之间关系的显式可解释理解；显式建图方法依赖额外3D传感器且阻碍大规模预训练。

### 🛠️ 方法
1) 结构化推理模块促进空间和任务导向的自我意识；2) 自动数据引擎与进度分割实现有效训练；3) 完全端到端，无需额外传感器。

### 📊 效果
在Habitat模拟器的多个数据集上显著超越之前的SOTA视觉语言导航方法。

### 🤖 AI 评价
自我意识概念在导航中的引入很有新意。完全端到端的设计兼顾了实用性和可扩展性，避免了3D传感器的依赖。自动数据引擎的进度分割策略对训练效率至关重要。项目页面已公开，透明度好。评分：8/10

**标签**: Vision-Language Navigation, Embodied AI, Self-awareness, Habitat

---

## 8. GesVLA: Gesture-Aware Vision-Language-Action Model Embedded Representations

**作者**: Wenxuan Guo, Ziyuan Li, Meng Zhang, Yichen Liu, Yimeng Dong, Chuxi Xu, Yunfei Wei, Ze Chen, Erjin Zh...  
**评分**: ⭐⭐⭐⭐ (8/10)  
**链接**: [http://arxiv.org/abs/2605.22812v1](http://arxiv.org/abs/2605.22812v1)  
**类别**: `cs.CV`

<!--more-->

### 🔍 核心内容
提出GesVLA，一种手势感知视觉-语言-动作模型。将手势特征直接编码到潜在空间，使其参与高级推理和低级动作生成，采用双VLM架构实现手势表示与动作策略的紧密耦合。

### ❓ 解决的问题
现有VLA系统主要依赖文本指令，难以解决复杂场景中多个相似物体的空间歧义问题，人机交互效率受限。

### 🛠️ 方法
1) 手势特征编码到潜在空间；2) 双VLM架构；3) 可扩展的手势数据生成流水线（将手模型渲染到真实场景图像）；4) 两阶段训练策略。

### 📊 效果
在多个真实机器人任务（积木操作、产品选择、农产品选择）中，手势持续提高目标定位准确性和人机交互效率，尤其在复杂杂乱环境中。

### 🤖 AI 评价
手势作为并行指令模态的引入填补了VLA系统的关键空白。渲染手模型到真实图像的数据生成策略巧妙解决了sim-to-real视觉差距。双VLM架构设计合理，实验覆盖了从受控到实用的多种场景，实用性强。评分：8/10

**标签**: VLA, Robot Manipulation, Gesture, Human-Robot Interaction

---

## 9. Sensor2Sensor: Cross-Embodiment Sensor Conversion for Autonomous Driving

**作者**: Jiahao Wang, Bo Sun, Yijing Bai, Vincent Casser, Songyou Peng, Zehao Zhu, Meng-Li Shih, Xander Masot...  
**评分**: ⭐⭐⭐⭐ (8/10)  
**链接**: [http://arxiv.org/abs/2605.22809v1](http://arxiv.org/abs/2605.22809v1)  
**类别**: `cs.CV`

<!--more-->

### 🔍 核心内容
提出Sensor2Sensor生成式建模范式，将野生单目行车记录仪视频转换为高保真多模态传感器套件（多视角相机图像和LiDAR点云）。利用4D高斯溅射从真实AV日志生成合成dashcam视频进行训练。

### ❓ 解决的问题
自动驾驶系统需要大规模多样化数据集，但专有AV数据规模有限；野生行车记录仪数据规模巨大但结构不兼容，无法直接用于ADS训练和验证。

### 🛠️ 方法
1) 通过4DGS重建和新视角渲染将真实AV日志转换为dashcam风格视频；2) 扩散架构进行生成式传感器转换；3) 无配对数据的跨模态转换。

### 📊 效果
在生成传感器数据的保真度和真实感上进行了全面定量评估；成功将具有挑战性的野生互联网和行车记录仪 footage 转换为真实的多模态数据格式。

### 🤖 AI 评价
问题定义精准——弥合野生数据与结构化传感器数据之间的鸿沟。4DGS作为桥梁生成配对训练数据的思路很聪明，避开了大规模配对采集的难题。扩散架构的应用符合当前生成式建模趋势。如果能在大规模ADS训练上验证性能提升，影响力将更大。评分：8/10

**标签**: Autonomous Driving, Sensor Conversion, 4D Gaussian Splatting, Diffusion

---

## 10. Integrable Elasticity via Neural Demand Potentials

**作者**: Carlos Heredia, Daniel Roncel  
**评分**: ⭐⭐⭐ (7/10)  
**链接**: [http://arxiv.org/abs/2605.22820v1](http://arxiv.org/abs/2605.22820v1)  
**类别**: `cs.LG`

<!--more-->

### 🔍 核心内容
提出Integrable Context-Dependent Demand Network (ICDN)，一种需求优先的神经模型，学习对数需求作为对数价格的平滑、上下文条件函数，从而精确导出弹性系数。

### ❓ 解决的问题
多产品零售需求建模中，现有方法难以获得稳定、经济学上合理的弹性估计，尤其是弱识别的交叉价格效应。

### 🛠️ 方法
将需求建模为可积函数（满足Slutsky对称性），使用神经网络学习对数需求面，弹性系数从学习到的需求面精确解析导出。

### 📊 效果
在Dominick's啤酒数据集上，ICDN相比有向对数-对数基准模型提升了样本外泛化能力，产生更稳定、经济学上更合理的弹性估计。

### 🤖 AI 评价
经济学与深度学习的有趣交叉。可积性约束确保模型符合经济理论，避免了纯数据驱动方法可能出现的违反经济学常识的问题。应用场景明确（零售定价），但数据集较老旧，现代电商数据的验证将是下一步。评分：7/10

**标签**: Economics, Deep Learning, Retail Demand, Elasticity

---

## 📈 今日统计

- **论文总数**: 10 篇
- **数据来源**: ArXiv RSS (cs.AI, cs.LG, cs.CL, cs.CV, cs.RO)
- **更新时间**: 2026-05-24

---

*本报告由 AI 自动生成，仅供参考。论文观点不代表本站立场。*
