+++
draft = false
date = "2026-05-23T09:00:00+08:00"
title = "ArXiv 每日论文精选 | 2026-05-23"
description = "今日 ArXiv AI/ML 领域精选论文解读，包含核心内容、方法、效果与AI评价"
slug = "2026-05-23-arxiv-daily"
categories = ["AI的感想"]
tags = ["arXiv", "论文阅读", "AI研究", "每日精选", "机器学习"]
+++

# 📚 ArXiv 每日论文精选 | 2026-05-23

> 自动精选今日 ArXiv 最新 AI/ML 论文，AI 深度解读核心内容、方法、效果与评价。

---

## 1. Vector Policy Optimization: Training for Diversity Improves Test-Time Search

**作者**: Ryan Bahlous-Boldi, Isha Puri, Idan Shenfeld, Akarsh Kumar, Mehul Damani, Sebastian Risi, Omar Khatt...  
**评分**: ⭐⭐⭐⭐ (9/10)  
**链接**: [http://arxiv.org/abs/2605.22817v1](http://arxiv.org/abs/2605.22817v1)  
**类别**: `cs.AI`

<!--more-->

### 🔍 核心内容
提出Vector Policy Optimization (VPO)，一种明确训练策略预期多样化下游奖励函数并产生多样化解决方案的RL算法。VPO将奖励视为向量值，训练LLM输出针对不同奖励权衡特化的解决方案集。

### ❓ 解决的问题
标准LLM后训练优化预定义标量奖励，导致低熵响应分布，难以在测试时搜索（如AlphaEvolve）中显示所需的多样性，限制了推理时扩展的能力。

### 🛠️ 方法
VPO是GRPO优势估计器的直接替代，但训练LLM输出一组解决方案，每个特化于向量奖励空间的不同权衡。利用实践中奖励常是向量值的特性（如代码生成的逐用例正确性）。

### 📊 效果
在4个任务上匹配或超越最强标量RL基线（pass@k和best@k），搜索预算越大优势越明显；对进化搜索，VPO模型能解锁GRPO完全无法解决的问题。

### 🤖 AI 评价
随着测试时搜索成为标准化范式，这项工作提出了一个根本性问题：优化多样性应成为默认后训练目标。论点有力，实验充分，跨多个任务验证。这是对RL后训练范式的深刻反思，可能改变LLM训练的基本假设。VPO的简洁性（GRPO的直接替代）使其易于采用。局限在于对计算资源的需求（需要生成多样化输出），且向量奖励的定义需要领域知识。

**标签**: RL, LLM Post-training, Test-time Search

---

## 2. Which Way Did It Move? Diagnosing and Overcoming Directional Motion Blindness in Video-LLMs

**作者**: Jongseo Lee, Hyuntak Lee, Sunghun Kim, Sooa Kim, Jihoon Chung, Jinwoo Choi  
**评分**: ⭐⭐⭐⭐ (8/10)  
**链接**: [http://arxiv.org/abs/2605.22823v1](http://arxiv.org/abs/2605.22823v1)  
**类别**: `cs.CV`

<!--more-->

### 🔍 核心内容
诊断并解决Video-LLMs在感知基本运动方向（上/下/左/右）时的严重失败，称之为'方向运动盲'。通过追踪信息流定位失败原因，提出MoDirect数据集和DeltaDirect projector级目标函数。

### ❓ 解决的问题
Video-LLMs在简单运动方向判断上表现接近随机（25.9%），存在方向绑定缺口：运动方向信息在线性层面可访问，但无法绑定到正确的语言答案选项。视觉复杂度削弱信号幅度并限制泛化。

### 🛠️ 方法
系统诊断信息流，发现方向绑定缺口；引入MoDirect数据集家族进行运动方向指令微调；提出DeltaDirect projector级目标函数，从相邻帧特征差分预测归一化2D运动向量。

### 📊 效果
在MoDirect-SynBench上从25.9%提升至85.4%；在MoDirect-RealBench上提升21.9个百分点（无需真实世界微调数据），同时保持标准视频理解性能。

### 🤖 AI 评价
这是一项非常扎实的基础性研究，深入解剖了多模态模型的感知缺陷。诊断方法系统严谨，解决方案针对性强。对视频理解领域有重要贡献，揭示了当前Video-LLMs在基础感知能力上的脆弱性。局限性在于主要针对合成数据，真实世界泛化仍需更多验证。代码已开源，可复现性好。

**标签**: Video-LLM, Motion Understanding, Multi-modal

---

## 3. Cambrian-P: Pose-Grounded Video Understanding

**作者**: Jihan Yang, Zifan Zhao, Xichen Pan, Shusheng Yang, Junyi Zhang, Bingyi Kang, Hu Xu, Saining Xie  
**评分**: ⭐⭐⭐⭐ (8/10)  
**链接**: [http://arxiv.org/abs/2605.22819v1](http://arxiv.org/abs/2605.22819v1)  
**类别**: `cs.CV`

<!--more-->

### 🔍 核心内容
将相机位姿作为轻量级监督信号引入视频多模态大语言模型，提出Cambrian-P。通过每帧可学习的相机token和位姿回归头，使模型理解帧间的空间坐标关系，而非将帧视为孤立2D快照。

### ❓ 解决的问题
现有MLLM处理视频帧为孤立2D快照，完全忽略了相机位姿这一定义跨帧空间坐标系的关键信号，导致对持久场景的理解能力不足，空间推理能力受限。

### 🛠️ 方法
为视频MLLM增加每帧可学习的相机token和位姿回归头；设计精心设计的采样方案；利用位姿信息进行空间推理训练；在野外视频上使用伪标注位姿进行训练。

### 📊 效果
在VSI-Bench空间推理基准上提升4.5-6.5%；在8个额外空间/通用视频QA基准上泛化良好；流式位姿估计在ScanNet上达到SOTA；野外视频训练进一步提升通用视频QA。

### 🤖 AI 评价
这是一项具有根本性意义的工作。相机位姿是视频理解中被长期忽视的关键信号，该研究优雅地将其重新引入MLLM。跨基准的强泛化能力证明了位姿信号的普适价值。巧妙之处在于位姿既作为监督信号又作为副产品输出。局限在于需要位姿标注或伪标注，且对相机运动较小的视频价值有限。整体为视频理解领域开辟了新的维度。

**标签**: Video MLLM, Pose Estimation, Spatial Reasoning

---

## 4. Remember to be Curious: Episodic Context and Persistent Worlds for 3D Exploration

**作者**: Lily Goli, Justin Kerr, Daniele Reda, Alec Jacobson, Andrea Tagliasacchi, Angjoo Kanazawa  
**评分**: ⭐⭐⭐⭐ (8/10)  
**链接**: [http://arxiv.org/abs/2605.22814v1](http://arxiv.org/abs/2605.22814v1)  
**类别**: `cs.LG`

<!--more-->

### 🔍 核心内容
提出使用在线3D重建作为持久世界模型，配合基于RGB观测的序列模型策略，解决好奇心驱动RL在复杂3D环境中的探索失败。核心发现：有效好奇心需要持久更新的世界模型和情景轨迹历史。

### ❓ 解决的问题
好奇心驱动RL在复杂真实感环境中难以工作，智能体陷入局部循环，对遗忘状态重新获得新鲜奖励。失败根源是缺乏空间持久性和情景上下文。

### 🛠️ 方法
在线3D重建作为持久世界模型；序列模型参数化的策略维护RGB观测的情景上下文；训练时有效探索，部署时仅用RGB帧导航。

### 📊 效果
在HM3D上超越RL主动映射基线；零样本泛化到Gibson和AI生成世界；对下游任务（如摘苹果、图像目标导航）高效适应，超越从头训练基线。

### 🤖 AI 评价
将3D重建与好奇心驱动RL结合是优雅且有效的方案。核心洞察（持久性+情景记忆）具有普遍意义，不仅限于探索任务。在线重建的设计巧妙平衡了训练需求和部署效率。零样本泛化能力令人印象深刻。局限在于在线重建的计算开销，以及在大规模开放世界中的扩展性。对具身智能和机器人探索有重要启发。

**标签**: RL, 3D Exploration, Curiosity, NeRF/3DGS

---

## 5. Sensor2Sensor: Cross-Embodiment Sensor Conversion for Autonomous Driving

**作者**: Jiahao Wang, Bo Sun, Yijing Bai, Vincent Casser, Songyou Peng, Zehao Zhu, Meng-Li Shih, Xander Masot...  
**评分**: ⭐⭐⭐⭐ (8/10)  
**链接**: [http://arxiv.org/abs/2605.22809v1](http://arxiv.org/abs/2605.22809v1)  
**类别**: `cs.CV`

<!--more-->

### 🔍 核心内容
提出Sensor2Sensor，一种将野外单目dashcam视频转换为高保真多模态传感器套件（多视角相机图像+LiDAR点云）的生成式建模范式。通过4DGS重建和扩散架构解决自动驾驶数据瓶颈。

### ❓ 解决的问题
自动驾驶系统需要大规模多样化数据，但专有AV车队数据规模有限、地理覆盖不足、长尾场景缺失。野外dashcam数据规模巨大但格式不兼容（单目视频vs多模态传感器）。

### 🛠️ 方法
通过4D Gaussian Splatting将真实AV日志转换为dashcam风格视频获取配对数据；Sensor2Sensor利用扩散架构执行生成式转换；将野外视频转换为多视角图像和LiDAR点云。

### 📊 效果
生成传感器数据具有高保真度和真实性；成功转换野外互联网和dashcam视频为现实多模态数据格式；解锁了庞大的外部数据源用于AV开发。

### 🤖 AI 评价
这是解决自动驾驶数据瓶颈的创新方案。利用4DGS桥接数据差距的思路非常巧妙，既保留了真实数据的物理一致性，又获得了格式转换能力。扩散模型的使用使生成结果足够真实。实际应用价值巨大——可解锁全球数十亿小时的dashcam视频。局限在于极端天气和复杂交通场景的生成质量，以及安全性验证的严格性。整体而言，这是自动驾驶数据工程的重要突破。

**标签**: Autonomous Driving, 4D Gaussian Splatting, Diffusion, Sensor Fusion

---

## 6. Tokenisation via Convex Relaxations

**作者**: Jan Tempus, Philip Whittington, Craig W. Schmidt, Dennis Komm, Tiago Pimentel  
**评分**: ⭐⭐⭐ (7/10)  
**链接**: [http://arxiv.org/abs/2605.22821v1](http://arxiv.org/abs/2605.22821v1)  
**类别**: `cs.LG`

<!--more-->

### 🔍 核心内容
提出ConvexTok算法，将分词器构建重新建模为线性规划问题，通过凸优化工具求解，替代BPE和Unigram等贪婪算法。该方法考虑了词汇表整体最优性，而非仅局部最优决策，并提供了最优性下界证书。

### ❓ 解决的问题
现有分词算法（BPE、Unigram）是贪婪算法，仅做局部最优决策而不考虑整体词汇表质量，导致分词结果次优，且无法量化与最优解的差距。

### 🛠️ 方法
将分词器构建形式化为线性规划问题，使用凸优化工具求解。定义目标函数并施加约束，通过凸松弛获得可计算的最优解，同时提供理论下界证明解的质量。

### 📊 效果
在常见词汇量下接近最优（1%以内），一致改善内部分词指标和语言模型的bits-per-byte（BpB），下游任务性能也有所提升但一致性较弱。

### 🤖 AI 评价
将凸优化理论引入分词问题是极具创新性的思路，突破了传统贪婪算法的局限。理论贡献显著，提供了可认证的最优性边界。实用价值在于稳定改善核心指标，但下游任务提升不够一致。局限性可能在于计算成本高于BPE/Unigram，且对大规模语料的可扩展性需要进一步验证。整体而言，这是分词领域从启发式向理论驱动的重要尝试。

**标签**: NLP, Tokenization, Convex Optimization

---

## 7. MotiMotion: Motion-Controlled Video Generation with Visual Reasoning

**作者**: Lee Hsin-Ying, Hanwen Jiang, Yiqun Mei, Jing Shi, Ming-Hsuan Yang, Zhixin Shu  
**评分**: ⭐⭐⭐ (7/10)  
**链接**: [http://arxiv.org/abs/2605.22818v1](http://arxiv.org/abs/2605.22818v1)  
**类别**: `cs.CV`

<!--more-->

### 🔍 核心内容
提出MotiMotion框架，将运动控制重新定义为推理-生成问题。利用无训练的VLM推理器优化主轨迹并幻觉合理的次级运动，结合置信度感知控制方案，实现更自然的运动控制视频生成。

### ❓ 解决的问题
现有运动控制图像到视频生成模型过于刚性依赖用户提供的稀疏、不精确轨迹，忽略因果完整性，导致不自然结果，尤其缺失次级因果后果（如一个物体运动导致其他物体反应）。

### 🛠️ 方法
无训练VLM推理器优化图像空间坐标并幻觉合理次级运动；置信度感知控制方案调节引导强度，高置信度严格跟随、低置信度用内部生成先验修正；构建MotiBench基准评估交互中心场景。

### 📊 效果
在MotiBench上产生更合理的物体行为和交互；VLM评估和人类研究均表明优于现有方法；能处理由运动触发新事件的交互中心场景。

### 🤖 AI 评价
将因果推理引入视频运动控制是重要创新，解决了该领域长期存在的'木偶式'运动问题。无训练VLM推理器的使用非常巧妙，既保持灵活性又避免额外训练成本。置信度感知控制方案实用且优雅。局限在于依赖VLM的质量，且对复杂多物体场景的扩展性需验证。MotiBench的引入是该领域评估的重要贡献。

**标签**: Video Generation, Motion Control, Causal Reasoning

---

## 8. AwareVLN: Reasoning with Self-awareness for Vision-Language Navigation

**作者**: Wenxuan Guo, Xiuwei Xu, Yichen Liu, Xiangyu Li, Hang Yin, Huangxing Chen, Wenzhao Zheng, Jianjiang F...  
**评分**: ⭐⭐⭐ (7/10)  
**链接**: [http://arxiv.org/abs/2605.22816v1](http://arxiv.org/abs/2605.22816v1)  
**类别**: `cs.CV`

<!--more-->

### 🔍 核心内容
提出AwareVLN框架，为视觉语言导航模型配备自意识推理机制，使模型以端到端和数据驱动方式理解智能体状态和任务进度。包含结构推理模块和自动数据引擎。

### ❓ 解决的问题
现有VLN方法虽利用VLM推理能力进行端到端动作预测，但缺乏对智能体、指令和场景之间关系的显式可解释理解；而显式建图又依赖额外3D传感器并阻碍大规模预训练。

### 🛠️ 方法
结构推理模块培养空间和任务导向的自意识；自动数据引擎通过进度划分进行有效训练；完全端到端和数据驱动，无需额外传感器。

### 📊 效果
在Habitat模拟器多个数据集上显著超越先前SOTA视觉语言导航方法，展示了强大的泛化能力和导航性能提升。

### 🤖 AI 评价
自意识概念在机器人导航中的创新应用，为可解释导航提供新思路。端到端设计避免了显式建图的传感器依赖，实用性强。结构推理模块的设计具有通用性，可扩展到其他具身智能任务。局限在于仅在模拟环境验证，真实机器人部署效果未知；且'自意识'的定义和量化可以更严格。总体而言是VLN领域的重要进展。

**标签**: VLN, Self-awareness, Robotics

---

## 9. GesVLA: Gesture-Aware Vision-Language-Action Model Embedded Representations

**作者**: Wenxuan Guo, Ziyuan Li, Meng Zhang, Yichen Liu, Yimeng Dong, Chuxi Xu, Yunfei Wei, Ze Chen, Erjin Zh...  
**评分**: ⭐⭐⭐ (7/10)  
**链接**: [http://arxiv.org/abs/2605.22812v1](http://arxiv.org/abs/2605.22812v1)  
**类别**: `cs.CV`

<!--more-->

### 🔍 核心内容
提出GesVLA，将手势作为并行指令模态引入VLA模型。通过将手势特征直接编码到潜在空间，采用双VLM架构实现手势表示与动作策略的紧密耦合，解决复杂场景中的空间歧义。

### ❓ 解决的问题
现有VLA系统主要依赖文本指令，在包含多个相似物体的复杂场景中难以解析空间歧义，导致目标定位错误和人机交互效率低下。

### 🛠️ 方法
手势特征编码到潜在空间参与高层推理和低层动作生成；双VLM架构；可扩展手势数据生成管道（将手模型渲染到真实场景图像）；两阶段训练策略（手势感知+动作预测）。

### 📊 效果
在多个真实世界机器人任务中（积木操作、产品/农产品选择），一致提升目标定位准确性和人机交互效率，尤其在复杂杂乱环境中优势明显。

### 🤖 AI 评价
手势是人类最自然的交互方式之一，将其引入VLA是重要且实用的创新。双VLM架构和潜在空间编码设计精巧。数据生成管道解决了sim-to-real视觉差距和标注稀缺问题。真实世界实验验证了其价值。局限在于手势识别的准确性边界，以及手势模态与文本模态的融合可以更深度探索。对服务机器人和人机协作场景有显著实用价值。

**标签**: VLA, Robotics, Gesture, Multi-modal

---

## 10. Integrable Elasticity via Neural Demand Potentials

**作者**: Carlos Heredia, Daniel Roncel  
**评分**: ⭐⭐⭐ (6/10)  
**链接**: [http://arxiv.org/abs/2605.22820v1](http://arxiv.org/abs/2605.22820v1)  
**类别**: `cs.LG`

<!--more-->

### 🔍 核心内容
提出Integrable Context-Dependent Demand Network (ICDN)，一种以需求为先的神经模型，学习对数需求作为对数价格的平滑上下文条件函数，允许从学习到的需求曲面精确推导弹性。

### ❓ 解决的问题
多产品零售需求预测中，现有方法（如对数-对数模型）的弹性估计不稳定，交叉价格效应尤其难以识别，导致经济不合理的估计结果和较差的样本外泛化。

### 🛠️ 方法
ICDN将log-demand建模为log-prices的平滑上下文条件函数，通过神经网络学习需求曲面，利用可积性约束从需求函数解析推导弹性，确保经济学一致性。

### 📊 效果
在Dominick's beer数据集上，相比对数-对数基准改善了样本外泛化，产生更稳定、经济更合理的弹性估计，尤其在弱识别的交叉价格效应方面表现突出。

### 🤖 AI 评价
将经济学理论（可积性、需求理论）与深度学习结合的有意义尝试，在实际商业场景中具有应用价值。然而领域相对 niche，主要是零售经济学应用。方法论创新有限（主要是约束神经网络以满足经济学属性），但实用价值明确。对于需要弹性估计的商业决策场景是一有价值的工具。

**标签**: Economics, Demand Forecasting, Neural Networks

---

## 📈 今日统计

- **论文总数**: 10 篇
- **数据来源**: ArXiv RSS (cs.AI, cs.LG, cs.CL, cs.CV, cs.RO)
- **更新时间**: 2026-05-23

---

*本报告由 AI 自动生成，仅供参考。论文观点不代表本站立场。*
