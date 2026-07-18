+++
draft = false
date = "2026-07-18T09:00:00+08:00"
title = "ArXiv 每日论文精选 | 2026-07-18"
description = "今日 ArXiv AI/ML 领域精选论文解读，包含核心内容、方法、效果与AI评价"
slug = "2026-07-18-arxiv-daily"
categories = ["AI的感想"]
tags = ["arXiv", "论文阅读", "AI研究", "每日精选", "机器学习"]
+++

# 📚 ArXiv 每日论文精选 | 2026-07-18

> 自动精选今日 ArXiv 最新 AI/ML 论文，AI 深度解读核心内容、方法、效果与评价。

---

## 1. RoboTTT: Context Scaling for Robot Policies

**作者**: Yunfan Jiang, Yevgen Chebotar, Ruijie Zheng, Fengyuan Hu, Yunhao Ge, Jimmy Wu, Tianyuan Dai, Scott R...  
**评分**: ⭐⭐⭐⭐ (9/10)  
**链接**: [http://arxiv.org/abs/2607.15275v1](http://arxiv.org/abs/2607.15275v1)  
**类别**: `cs.AI`

<!--more-->

### 🔍 核心内容
提出RoboTTT，将机器人视觉-运动上下文扩展到8K时间步，通过测试时训练把历史信息压缩进快速权重，在不增加推理延迟的情况下实现长上下文条件化。

### ❓ 解决的问题
现有机器人基础模型多采用单步或短历史上下文，难以完成长程、多阶段、高动态扰动下的复杂操作任务。

### 🛠️ 方法
将测试时训练融入Vision-Language-Action策略，序列动作强制配合截断时间反向传播，训练8K时间步的上下文模型。

### 📊 效果
在真实机器人任务上总体性能比单步基线提升87%，并首次完成5分钟十阶段装配任务；8K上下文模型比1K预训练提升62%。

### 🤖 AI 评价
9

**标签**: 机器人策略, 测试时训练, 长上下文, VLA

---

## 2. Hierarchical Denoising For Multi-Step Visual Reasoning

**作者**: Zezhong Qian, Xiaowei Chi, Chak-Wing Mak, Tianze Zhou, Ruibin Yuan, Yuhan Rui, Hengzhe Sun, Zhuoqun ...  
**评分**: ⭐⭐⭐⭐ (8/10)  
**链接**: [http://arxiv.org/abs/2607.15278v1](http://arxiv.org/abs/2607.15278v1)  
**类别**: `cs.CV`

<!--more-->

### 🔍 核心内容
提出HDR框架，将树状层次化潜变量融入因果视频生成，实现粗到精的多步视觉推理。粗层保留不确定假设以支持全局规划，细层逐步将其细化为具体视觉状态，并通过稀疏层次注意力降低时序计算开销。

### ❓ 解决的问题
流式自回归扩散模型推理能力弱，而双向扩散虽可全局修订但逐帧密集去噪导致推理成本极高，两者难以同时保证逻辑一致性与低延迟流式输出。

### 🛠️ 方法
设计层次化视频潜变量结构、SHAP稀疏层次注意力模式，并在六个推理任务上构建OOD多步视频推理基准，支持低延迟流式生成。

### 📊 效果
成功率从34.22提升至60.29（相对提升76.2%），平均进度从76.00提升至89.56；延迟仅0.70秒/潜变量，比双向扩散快54.2倍；2%训练数据即可保留82.9%全数据性能。

### 🤖 AI 评价
8

**标签**: 视觉推理, 扩散模型, 视频生成, 层次化去噪

---

## 3. MeanFlowNFT: Bringing Forward-Process RL to Average-Velocity Generators

**作者**: Yushi Huang, Xiangxin Zhou, Jun Zhang, Liefeng Bo, Tianyu Pang  
**评分**: ⭐⭐⭐⭐ (8/10)  
**链接**: [http://arxiv.org/abs/2607.15273v1](http://arxiv.org/abs/2607.15273v1)  
**类别**: `cs.LG`

<!--more-->

### 🔍 核心内容
将DiffusionNFT前向过程强化学习框架扩展到MeanFlow平均速度生成器，通过构造诱导瞬时速度预测器，使奖励优化在保持少步平均速度采样的同时变得良定义。

### ❓ 解决的问题
MeanFlow通过预测平均速度实现快速少步采样，但DiffusionNFT针对瞬时速度优化，难以直接应用于MeanFlow模型，RL调优在MeanFlow上研究不足。

### 🛠️ 方法
利用MeanFlow恒等式桥接平均速度与瞬时速度，构建诱导瞬时速度预测器并应用DiffusionNFT目标，保持原始平均速度采样流程。

### 📊 效果
在图像和视频生成上持续超越基线，SD3.5-M八项指标中六项最优；Wan 2.1上4步MeanFlowNFT的VBench达84.33，超过50步LongCat-Video RL的82.57。

### 🤖 AI 评价
8

**标签**: 生成模型, 流模型, 强化学习, 少步采样

---

## 4. Online Neural Space Time Memory for Dynamic Novel View Synthesis

**作者**: Baback Elmieh, Lynn Tsai, Zeman Li, Srinivas Kaza, Tiancheng Sun, Gabor Csapo, Ali Behrouz, Yuan Den...  
**评分**: ⭐⭐⭐⭐ (8/10)  
**链接**: [http://arxiv.org/abs/2607.15271v1](http://arxiv.org/abs/2607.15271v1)  
**类别**: `cs.LG`

<!--more-->

### 🔍 核心内容
提出在线神经时空记忆方法，用于多视角流视频的动态新视角合成。通过解耦记忆更新与应用频率，实现实时性能与长程记忆共存。

### ❓ 解决的问题
在线新视角合成需要在长程持久记忆与严格实时约束之间权衡；测试时训练要求每帧梯度更新，计算重且长期不稳定。

### 🛠️ 方法
周期性更新记忆、每帧应用记忆，结合跨视图注意力处理形变；引入辅助记忆损失锁定历史上下文，并采用记忆缓存抑制灾难性漂移。

### 📊 效果
在动态人体场景和分钟级在线记忆任务上达到实时SOTA性能，显著优于逐帧更新的TTT方案。

### 🤖 AI 评价
8

**标签**: 新视角合成, 动态场景, 记忆机制, 实时渲染

---

## 5. Motion-Conditioned Multi-View Fusion for Myocardial Infarction Localization from Echocardiography

**作者**: Guang Yang, Wentian Xu, Siyu Wang, Betty Raman, Lei Li, Vicente Grau  
**评分**: ⭐⭐⭐⭐ (8/10)  
**链接**: [http://arxiv.org/abs/2607.15268v1](http://arxiv.org/abs/2607.15268v1)  
**类别**: `cs.CV`

<!--more-->

### 🔍 核心内容
提出MCF-Net，将心肌运动线索与超声基础模型表示相融合，从双视角超声心动图中实现心肌梗死的 segment-level 定位。

### ❓ 解决的问题
超声心动图评估心梗广泛使用，但单视角存在视角歧义，现有运动分析方法依赖手工描述符或密集标注，难以在临床推广。

### 🛠️ 方法
采用预训练EchoPrime提取双视角视觉特征，以单帧模板实现稀疏运动跟踪，并通过运动条件融合机制在运动与视觉线索间互补增强。

### 📊 效果
在segment-level心肌梗死定位上达到72.4% F1和84.9%准确率，优于纯运动、纯视觉以及现有融合基线。

### 🤖 AI 评价
8

**标签**: 医学影像, 超声心动图, 心肌梗死定位, 多视角融合

---

## 6. Pretraining Data Can Be Poisoned through Computational Propaganda

**作者**: Victoria Graf, Hannaneh Hajishirzi, Noah A. Smith, David Kohlbrenner, Kyle Lo  
**评分**: ⭐⭐⭐⭐ (8/10)  
**链接**: [http://arxiv.org/abs/2607.15267v1](http://arxiv.org/abs/2607.15267v1)  
**类别**: `cs.AI`

<!--more-->

### 🔍 核心内容
研究通过公共讨论界面（如评论、论坛）向网络内容注入恶意信息，从而污染大型语言模型预训练数据的可行性，并提出HalfLife方法评估投毒内容在数据整理后是否仍被纳入训练。

### ❓ 解决的问题
以往数据投毒研究多基于Wikipedia等静态小规模数据，忽略了真实web-scale预训练语料和curation流程对毒化效果的影响。

### 🛠️ 方法
利用公开讨论接口进行内容注入，设计HalfLife分析估计对抗内容在web-crawl LM训练数据中的保留概率，并系统评估跨场景可行性。

### 📊 效果
证实通过第三方网页内容污染预训练数据是现实可行的，强调必须在评估中考虑毒化内容是否真正进入最终训练集。

### 🤖 AI 评价
8

**标签**: 数据安全, 预训练投毒, 网络爬虫, 对抗攻击

---

## 7. SceneBind: Binding What and Where Across Vision, Audio and Language

**作者**: Mingfei Chen, Zijun Cui, Ruoke Zhang, Hyeonggon Ryu, Eli Shlizerman  
**评分**: ⭐⭐⭐⭐ (8/10)  
**链接**: [http://arxiv.org/abs/2607.15265v1](http://arxiv.org/abs/2607.15265v1)  
**类别**: `cs.AI`

<!--more-->

### 🔍 核心内容
提出SceneBind，一种面向真实场景的跨视觉、音频、语言的全模态表示，显式建模场景级语义与3D空间结构，实现“是什么”与“在哪里”的绑定。

### ❓ 解决的问题
现有多模态编码器在实例级语义上表现强，但缺乏显式空间结构，难以支持跨模态场景检索和对象定位。

### 🛠️ 方法
将场景表示为全局语义嵌入与对象中心语义-空间槽的组合，提出SceneBind Matching方案，并在真实双耳音视频数据集上训练轻量空间建模模块。

### 📊 效果
在场景与空间检索上达到SOTA，并能零样本迁移到音视频定位等下游任务，仅增加少量额外token。

### 🤖 AI 评价
8

**标签**: 多模态学习, 场景理解, 空间表示, 跨模态检索

---

## 8. Beyond Success Rate: Cost-Aware Evaluation of Offensive and Defensive Security Agents

**作者**: Paul Kassianik, Blaine Nelson, Yaron Singer  
**评分**: ⭐⭐⭐⭐ (8/10)  
**链接**: [http://arxiv.org/abs/2607.15263v1](http://arxiv.org/abs/2607.15263v1)  
**类别**: `cs.AI`

<!--more-->

### 🔍 核心内容
从成本与成功率双维度评估大语言模型安全智能体，覆盖红队进攻任务（Cybench CTF）与蓝队防守任务（Splunk BOTS v1 SOC调查），揭示两类任务的不同规模化规律。

### ❓ 解决的问题
安全智能体评估通常在高预算下测最佳成功率，忽略实际运营中推理、工具调用、遥测查询等成本，导致对模型实用价值的误判。

### 🛠️ 方法
在固定成本水平下比较模型，分解推理开销与工具开销，对进攻和防守任务分别进行成本-成功分析。

### 📊 效果
进攻CTF性能随测试时计算增加持续提升，开源大模型可在成本可控下接近专有模型；防守SOC调查更依赖工具使用纪律与选择性增强，单纯扩大推理预算收益有限。

### 🤖 AI 评价
8

**标签**: 安全智能体, 成本意识评估, 红队, 蓝队

---

## 9. Partition, Prompt, Aggregate: Statistical Self-Consistency in Language Models

**作者**: Patrik Wolf, Thomas Kleine Buening, Andreas Krause, Celestine Mendler-Dünner  
**评分**: ⭐⭐⭐ (7/10)  
**链接**: [http://arxiv.org/abs/2607.15277v1](http://arxiv.org/abs/2607.15277v1)  
**类别**: `cs.CL`

<!--more-->

### 🔍 核心内容
检验大语言模型在子群体与总体层面的估计是否满足全概率定律等统计自一致性。通过二叉树递归划分人群，用文本提示获取子群体估计后再聚合回总体估计。

### ❓ 解决的问题
若把上下文学习视为条件推断，则LLM估计应满足基本概率恒等式，但这一点尚未被系统评估，模型可能在聚合层面存在系统性偏差。

### 🛠️ 方法
构建二叉树粒度的评估支架，对多领域、多个前沿模型执行划分-提示-聚合协议，并深入分析persona prompting中的macro fallacy现象。

### 📊 效果
发现LLM普遍存在统计自一致性违背；细粒度子群体响应重建的估计反而更接近人类参考数据，且该效应在不同树结构和任务中持续存在。

### 🤖 AI 评价
7

**标签**: 大语言模型, 自一致性, 上下文学习, 统计评估

---

## 10. SciDiagramEdit: Learning to Edit Scientific Diagrams from Paper Revisions

**作者**: Yasheng Sun, Zezi Zeng, Yifan Yang, Chong Luo, Wenyi Wang, Ziwei Liu, Jürgen Schmidhuber  
**评分**: ⭐⭐⭐ (7/10)  
**链接**: [http://arxiv.org/abs/2607.15272v1](http://arxiv.org/abs/2607.15272v1)  
**类别**: `cs.AI`

<!--more-->

### 🔍 核心内容
构建SciDiagramEdit基准与技能进化框架，从arXiv论文版本历史中挖掘自然修订意图驱动的图表前后对，并在可编辑向量源上实现自然语言指令驱动的科学图表编辑。

### ❓ 解决的问题
科学图表是信息密集、元素异构、视觉语法严格的复杂信息图，传统方法难以根据自然语言指令自动完成标签重排、面板调整等日常编辑工作。

### 🛠️ 方法
利用真实论文修订数据作为训练信号，通过智能体执行轨迹多轮迭代地精炼技能规范，逐步提升编辑技能在验证集上的准确率。

### 📊 效果
随着技能进化，编辑准确率在验证集上持续提升，证明自然论文修订能有效训练指令驱动的科学图表编辑模型。

### 🤖 AI 评价
7

**标签**: 科学图表, 智能体学习, 指令跟随, 向量图形

---

## 📈 今日统计

- **论文总数**: 10 篇
- **数据来源**: ArXiv RSS (cs.AI, cs.LG, cs.CL, cs.CV, cs.RO)
- **更新时间**: 2026-07-18

---

*本报告由 AI 自动生成，仅供参考。论文观点不代表本站立场。*
