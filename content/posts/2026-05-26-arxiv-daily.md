+++
draft = false
date = "2026-05-26T09:00:00+08:00"
title = "ArXiv 每日论文精选 | 2026-05-26"
description = "今日 ArXiv AI/ML 领域精选论文解读，包含核心内容、方法、效果与AI评价"
slug = "2026-05-26-arxiv-daily"
categories = ["AI的感想"]
tags = ["arXiv", "论文阅读", "AI研究", "每日精选", "机器学习"]
+++

# 📚 ArXiv 每日论文精选 | 2026-05-26

> 自动精选今日 ArXiv 最新 AI/ML 论文，AI 深度解读核心内容、方法、效果与评价。

---

## 1. SkillOpt: Executive Strategy for Self-Evolving Agent Skills

**作者**: Yifan Yang, Ziyang Gong, Weiquan Huang, Qihao Yang, Ziwei Zhou, Zisu Huang, Yan Li, Xuemei Gao, Qi D...  
**评分**: ⭐⭐⭐⭐ (9/10)  
**链接**: [http://arxiv.org/abs/2605.23904v1](http://arxiv.org/abs/2605.23904v1)  
**类别**: `cs.AI`

<!--more-->

### 🔍 核心内容
提出首个系统化可控的文本空间Agent技能优化器SkillOpt，将技能训练视为冻结Agent的外部状态优化，通过独立的优化器模型将评分rollouts转化为有界的增删改编辑操作，仅在严格提升验证分数时接受编辑。

### ❓ 解决的问题
现有Agent技能依赖手工编写、一次性生成或松散控制的自我修订，缺乏类似深度学习优化器的系统化训练过程，无法在反馈下可靠提升。

### 🛠️ 方法
采用独立优化器模型执行文本空间编辑，引入文本学习率预算、拒绝编辑缓冲区和epoch级慢速/元更新确保稳定性，部署时零推理开销。

### 📊 效果
在52个评估单元中全部最优或并列最优，GPT-5.5上直接聊天提升+23.5分，Codex循环中+24.8分，Claude Code中+19.1分，且技能可跨模型和环境迁移。

### 🤖 AI 评价
创新性极高，首次将深度学习的优化纪律引入Agent技能训练，解决了技能优化的可复现性和可控性问题。实用性极强，零推理开销和跨环境迁移能力使其具备工程部署价值。不足之处在于对优化器模型的依赖可能增加系统复杂度。

**标签**: Agent, 技能优化, 文本空间优化, 迁移学习

---

## 2. PiD: Fast and High-Resolution Latent Decoding with Pixel Diffusion

**作者**: Yifan Lu, Qi Wu, Jay Zhangjie Wu, Zian Wang, Huan Ling, Sanja Fidler, Xuanchi Ren  
**评分**: ⭐⭐⭐⭐ (9/10)  
**链接**: [http://arxiv.org/abs/2605.23902v1](http://arxiv.org/abs/2605.23902v1)  
**类别**: `cs.CV`

<!--more-->

### 🔍 核心内容
提出PiD像素扩散解码器，将潜在解码重构为条件像素扩散，统一解码和上采样为单一生成模块，可直接在高分辨率像素空间去噪，支持4倍甚至8倍上采样，并通过DMD2蒸馏将推理降至4步。

### ❓ 解决的问题
现有潜在解码器以重建为导向，无法合成更多细节，且在百万像素级别成本急剧上升，需要更具表现力和效率的解码范式。

### 🛠️ 方法
将潜在解码建模为条件像素扩散；使用轻量级sigma感知适配器注入噪声损坏的latents；支持部分去噪latents提前终止；DMD2蒸馏减少推理步数至4步。

### 📊 效果
512x512解码为2048x2048在消费级RTX 5090上不到1秒（13GB显存），GB200上仅210毫秒，比级联扩散上采样快6倍且视觉质量更好。

### 🤖 AI 评价
创新性很高，将解码和上采样统一为生成模块是巧妙思路。实用性极强，消费级GPU上的亚秒级高分辨率生成具有重大工程价值。不足之处在于对sigma感知适配器的设计细节描述不够充分。

**标签**: 图像生成, 潜在解码, 像素扩散, 高效推理

---

## 3. LLMs as Noisy Channels: A Shannon Perspective on Model Capacity and Scaling Laws

**作者**: Xu Ouyang, Deyi Liu, Yuhang Cai, Jing Liu, Yuan Yang, Chen Zheng, Thomas Hartvigsen, Yiyuan Ma  
**评分**: ⭐⭐⭐⭐ (9/10)  
**链接**: [http://arxiv.org/abs/2605.23901v1](http://arxiv.org/abs/2605.23901v1)  
**类别**: `cs.AI`

<!--more-->

### 🔍 核心内容
提出香农扩展定律，将LLM训练建模为噪声信道上的信息传输，基于香农-哈特利定理映射模型参数到信道带宽、训练token到信号功率，揭示LLM的基本容量限制和U型性能退化现象。

### ❓ 解决的问题
现有单调幂律扩展定律无法解释灾难性过训练和量化导致的性能退化等非单调现象，缺乏统一的理论框架。

### 🛠️ 方法
建立噪声信道模型，显式捕获学习信号与内在噪声的交互；推导出信噪比阈值决定单调改善到U型退化的转变；在Pythia和OLMo2上通过高斯噪声、量化和微调验证。

### 📊 效果
 consistently优于经典扩展定律和扰动感知定律，拟合≤6.9B模型预测12B模型至307B token时R²=0.847，而单调基线失效。

### 🤖 AI 评价
理论创新性极高，首次用信息论框架统一解释扩展定律的异常现象。实用性强，可指导模型规模和数据量的最优配置。不足之处在于对非高斯噪声的建模可能需要进一步验证。

**标签**: 扩展定律, 信息论, 理论框架, 噪声信道

---

## 4. From Raw Experience to Skill Consumption: A Systematic Study of Model-Generated Agent Skills

**作者**: Zisu Huang, Jingwen Xu, Yifan Yang, Ziyang Gong, Qihao Yang, Muzhao Tian, Xiaohua Wang, Changze Lv, ...  
**评分**: ⭐⭐⭐⭐ (8/10)  
**链接**: [http://arxiv.org/abs/2605.23899v1](http://arxiv.org/abs/2605.23899v1)  
**类别**: `cs.AI`

<!--more-->

### 🔍 核心内容
构建基于实用性的评估框架，系统研究模型生成Agent技能的完整生命周期（经验生成、技能提取、技能消费），发现技能效用与模型规模无关，提出元技能指导提取以减少负迁移。

### ❓ 解决的问题
模型生成技能的研究缺乏对全生命周期的系统性理解，不清楚技能何时有效、什么因素决定成败，且存在非平凡的负迁移问题。

### 🛠️ 方法
设计跨五个Agent任务域的实验框架；深度分析经验组成如何塑造技能质量；提取有用技能的特征属性；构建元技能指导提取过程。

### 📊 效果
发现模型可以是强提取器但弱消费者；元技能持续改进跨领域技能质量并显著减少负迁移。

### 🤖 AI 评价
创新性良好，首次系统评估技能全生命周期。实用性强，元技能概念可直接应用于Agent系统优化。不足之处在于实验覆盖的任务域仍有限，更多复杂场景需要验证。

**标签**: Agent, 技能生命周期, 负迁移, 元技能

---

## 5. ETCHR: Editing To Clarify and Harness Reasoning

**作者**: Beichen Zhang, Yuhong Liu, Jinsong Li, Yuhang Zang, Jiaqi Wang, Dahua Lin  
**评分**: ⭐⭐⭐⭐ (8/10)  
**链接**: [http://arxiv.org/abs/2605.23897v1](http://arxiv.org/abs/2605.23897v1)  
**类别**: `cs.AI`

<!--more-->

### 🔍 核心内容
提出ETCHR，一种问题条件化的推理感知图像编辑模型，与下游理解模型解耦，通过两阶段训练（推理模仿+推理增强）解决编辑器作为推理助手的语言和生成双重缺口，可即插即用到各类MLLMs。

### ❓ 解决的问题
多模态大模型的视觉推理受限于纯文本思维链，现有''用图像思考''方法要么受限于固定工具包，要么产生噪声中间图像，缺乏灵活且高质量的推理辅助编辑能力。

### 🛠️ 方法
解耦专用图像编辑模型和理解模型；推理模仿阶段在编辑轨迹上监督微调；推理增强阶段用VLM衍生奖励优化编辑正确性和推理准确性。

### 📊 效果
Qwen3-VL-8B Pass@1从55.95提升至60.77(+4.82)；Gemini-3.1-Flash-Lite从65.08至70.55(+5.47)；Kimi K2.5从76.55至81.16(+4.61)。

### 🤖 AI 评价
创新性良好，解耦编辑器和理解器的设计简洁有效。实用性极强，无需训练即可适配多种MLLMs。不足之处在于对编辑轨迹的获取成本和质量依赖较高。

**标签**: 多模态推理, 图像编辑, 思维链, 视觉理解

---

## 6. From Activation to Causality: Discovery of Causal Visual Representations in the Human Brain

**作者**: Yuval Golbari, Navve Wasserman, Matias Cosarinsky, Roman Beliy, Aude Oliva, Antonio Torralba, Michal...  
**评分**: ⭐⭐⭐⭐ (8/10)  
**链接**: [http://arxiv.org/abs/2605.23895v1](http://arxiv.org/abs/2605.23895v1)  
**类别**: `cs.CV`

<!--more-->

### 🔍 核心内容
提出BrainCause框架，结合生成模型和脑模型合成控制刺激，通过因果测试验证神经表征，发现仅靠激活最大化会导致大量假阳性，证明激活不足以证明表征，成功识别已知和新候选视觉概念的大脑表征。

### ❓ 解决的问题
现有方法通过激活最大化定位脑区功能，但强激活可能由相关视觉或语义线索驱动，无法确定脑区是否真正表征目标概念，存在因果推断的根本缺陷。

### 🛠️ 方法
构建概念图像、反事实编辑（移除目标概念保留其他内容）和相关干扰物图像的刺激集；使用图像到fMRI编码模型预测脑响应；搜索对目标概念特异性响应的表征。

### 📊 效果
成功恢复已知功能定位并发现新候选表征；验证显示无因果验证时大量定位为假阳性；在预测和实测fMRI数据上均验证有效。

### 🤖 AI 评价
跨学科创新性极高，将因果推断引入神经科学。实用性中等，主要面向学术研究。不足之处在于fMRI实验验证仍需要实际执行，框架本身不能完全替代实验。

**标签**: 神经科学, 因果推断, fMRI, 视觉表征

---

## 7. Complete-muE: Optimal Hyperparameter Transfer and Scaling for MoE Models

**作者**: Hongwu Peng, Ohiremen Dibua, Yuanjun Xiong, Yifan Gong, Jianming Zhang, Yan Kang  
**评分**: ⭐⭐⭐⭐ (8/10)  
**链接**: [http://arxiv.org/abs/2605.23893v1](http://arxiv.org/abs/2605.23893v1)  
**类别**: `cs.LG`

<!--more-->

### 🔍 核心内容
提出Complete-muE框架，通过双桥系统解决MoE模型的超参数迁移问题：桥I用活跃宽度μP映射稠密FFN到稠密MoE，桥II用激活专家缩放映射稠密MoE到稀疏MoE，实现''一次调优，全配置迁移''。

### ❓ 解决的问题
现有μP和SDE工具无法直接解决MoE设置中的超参数迁移，因为稠密到MoE转换或MoE总专家数缩放同时改变架构和每步token数，导致超参数搜索成本高昂。

### 🛠️ 方法
桥I：活跃宽度μP+归一化路由缩放映射稠密到稠密MoE；桥II：激活专家缩放，一阶SDE修正抵消，残差σ₀偏移保持有界；覆盖激活专家数、总容量、粒度等多种变化。

### 📊 效果
语言和扩散模型预训练实验确认超参数最优值稳定，漂移足够小使得单次稠密调优可近最优迁移到所有MoE配置，加速MoE收敛。

### 🤖 AI 评价
创新性良好，扩展μP理论到MoE场景具有理论贡献。实用性强，大幅降低MoE模型开发成本。不足之处在于桥II的非严格SDE行为导致的小漂移在某些极端配置下可能需要额外校准。

**标签**: MoE, 超参数迁移, 扩展定律, Transformer

---

## 8. Geo-Align: Video Generation Alignment via Metric Geometry Reward

**作者**: Zizun Li, Haoyu Guo, Runzhe Teng, Chunhua Shen, Tong He  
**评分**: ⭐⭐⭐ (7/10)  
**链接**: [http://arxiv.org/abs/2605.23903v1](http://arxiv.org/abs/2605.23903v1)  
**类别**: `cs.CV`

<!--more-->

### 🔍 核心内容
提出首个针对相机控制视频重渲染的强化学习框架Geo-Align，通过尺度感知的感知奖励机制优化模型，引入度量3D估计器提取精确相机轨迹并惩罚偏差，同时设计无需配对数据的数据管道策略。

### ❓ 解决的问题
现有视频重渲染方法依赖监督微调和合成数据，缺乏同步多视角真实世界视频数据，导致泛化能力差，难以准确遵循物理尺度和相机轨迹。

### 🛠️ 方法
基于预训练模型，通过尺度感知奖励优化；使用度量3D估计器提取相机轨迹；设计基于真实条件视频和合成目标轨迹的数据策略消除配对依赖。

### 📊 效果
在精确相机可控性和视觉保真度方面持续超越现有监督学习基线，实验验证方法有效性。

### 🤖 AI 评价
创新性良好，将RL引入视频重渲染是新颖方向。实用性较强，解决了真实数据稀缺问题。不足之处在于论文未提供具体定量指标，且3D估计器的精度对最终效果影响较大。

**标签**: 视频生成, 强化学习, 相机控制, 3D估计

---

## 9. SPACENUM: Revisiting Spatial Numerical Understanding in VLMs

**作者**: Jianshu Zhang, Yijiang Li, Huifeixin Chen, Haoran Lu, Letian Xue, Bingyang Wang, Han Liu  
**评分**: ⭐⭐⭐ (7/10)  
**链接**: [http://arxiv.org/abs/2605.23898v1](http://arxiv.org/abs/2605.23898v1)  
**类别**: `cs.AI`

<!--more-->

### 🔍 核心内容
提出SpaceNum框架评估视觉语言模型在空间环境中的数值理解能力，通过Num2Space和Space2Num双向任务发现当前VLMs在数值与空间映射上接近随机猜测水平，揭示其依赖浅层空间线索的本质缺陷。

### ❓ 解决的问题
VLMs在具身环境中输出的数值（动作幅度、空间坐标）是否真正基于空间感知仍不清楚，现有评估无法检验数值输出的空间真实性。

### 🛠️ 方法
设计动态过渡（空间探索）和静态布局（空间推理）两种设置；构建双向映射任务；通过错误分析、推理追踪和干预实验诊断失败原因。

### 📊 效果
当前VLMs在空间数值理解上接近随机水平；显式推理仅带来边际提升；微调可部分改善并迁移到外部基准。

### 🤖 AI 评价
诊断性研究很有价值，揭示了VLM的一个被忽视但关键的缺陷。实用性中等，提出的评估框架可用于后续模型开发。不足之处在于对如何根本性解决该问题的方案探索不够深入。

**标签**: 视觉语言模型, 空间理解, 数值推理, 具身AI

---

## 10. Good Token Hunting: A Hitchhiker's Guide to Token Selection for Visual Geometry Transformers

**作者**: Shuhong Zheng, Michael Oechsle, Erik Sandström, Marie-Julie Rakotosaona, Federico Tombari, Igor Gili...  
**评分**: ⭐⭐⭐ (7/10)  
**链接**: [http://arxiv.org/abs/2605.23892v1](http://arxiv.org/abs/2605.23892v1)  
**类别**: `cs.AI`

<!--more-->

### 🔍 核心内容
提出两阶段token选择框架加速视觉几何Transformer：帧间选择基于多样性策略保留关键帧，帧内选择基于全局注意力模式熵进行层感知稀疏化，实现500图像场景85%以上加速且保持或提升性能。

### ❓ 解决的问题
视觉几何Transformer的全局注意力计算成本随序列长度二次增长，严重限制多视图3D重建的可扩展性和效率。

### 🛠️ 方法
限制每个查询在全局注意力中交互的key/value token数量；帧间选择采用多样性策略确保场景覆盖；帧内选择基于注意力熵的层感知稀疏化。

### 📊 效果
500图像场景加速超85%，同时保持甚至提升基线性能，提供优越的速度-精度权衡。

### 🤖 AI 评价
创新性中等，token选择策略本身不是全新概念，但针对视觉几何Transformer的具体设计（多样性+熵引导）有效。实用性强，直接解决3D重建的扩展性瓶颈。不足之处在于对极端稀疏情况下的精度损失分析不够深入。

**标签**: 视觉几何, Transformer, Token选择, 3D重建, 效率优化

---

## 📈 今日统计

- **论文总数**: 10 篇
- **数据来源**: ArXiv RSS (cs.AI, cs.LG, cs.CL, cs.CV, cs.RO)
- **更新时间**: 2026-05-26

---

*本报告由 AI 自动生成，仅供参考。论文观点不代表本站立场。*
