title: Machine Learning Course (from Andrew Ng, Coursera) Summary
tags:
  - Machine Learning
date: 2014-10-18 20:55:18
catagories:
---
(花了两个月闲暇时间学习的课程，就在这里总结给你看\>v<\!)
机器学习，主要是通过一个训练过程去优化某个衡量指标(这里称***cost function***)，最终实现与之相关的目标。
这门课上提到的算法都是静态的。只着眼于一次采样。要通过一次训练尽可能好地拟合真实函数。
为简洁起见以下不说明任何符号含义，最后才附上说明。

##有监督学习
有监督学习可以做分类和估值。

<!--more-->

**线性回归**
线性回归已经假设真实函数(目标函数)是线性的。
$h\_\theta(\mathbf{x}\_i) = \boldsymbol{\theta}^T\mathbf{x}\_i$ ， $\mathbf{h\_\theta(X)} = \boldsymbol{X\theta}$
用到的cost function:
$J(\boldsymbol{\theta}) = \frac{1}{2m}(h\_\theta(\mathbf{X})-\mathbf{y})^.2 + \lambda(\boldsymbol{\theta}\_{-0})^.2$
最优化cost方法1 —— 多次***gradient descent***求解:
$\boldsymbol{\theta'} = \boldsymbol{\theta}-\alpha\frac{\partial}{\partial\boldsymbol{\theta}}J(\boldsymbol{\theta}) = \boldsymbol{\theta}-\alpha\frac{1}{m}(\mathbf{X}(h\_\theta(\mathbf{X})-\mathbf{y})+\lambda\boldsymbol{\theta}\_{-0})$
最优化cost方法2 —— 数学直接求解***normal equation***:
$\boldsymbol{\theta} = (\mathbf{X}^T\mathbf{X}+\lambda\mathbf{1}\_{-0})^{-1}\mathbf{X}^T\mathbf{y}$
另外octave/matlab中还有类似fminunc等最优化函数可以直接求解。

线性回归是估值用的。$\lambda(\boldsymbol{\theta}\_{-0})^.2$项是为了避免Overfitting的***regularization项***。
规模比较大的数据，用gradient descent。规模比较小的数据，或者需要验证，用normal euqation，因为它计算逆矩阵要$O(n^3)$，计算量大。
注意normal equation还要保证特征之间独立才会有逆矩阵，否则只能用伪逆代替

**逻辑回归**
给回归函数套一个函数，保证值域是[0,1] : 
$h\_\theta(\mathbf{x}\_i) = sigmoid(\\boldsymbol{\theta}^T\mathbf{x}\_i)$，其中$sigmoid(z) = \frac{1}{1+e^{-z}}$。
用到的cost function：
$J(\boldsymbol{\theta}) = -\frac{1}{m}[\mathbf{y}^Tlog(\mathbf{h}\_\theta(\mathbf{X}))+(\mathbf{1-y})^Tlog(\mathbf{1-h}\_\theta(\mathbf{X}))] + \frac{\lambda}{2m}(\boldsymbol{\theta}\_{-0})^.2$
最优化cost的方法和线性回归一样，不赘述。

逻辑回归是分类用的（或者说结果集比较有限的估值）。
cost function作出的改变，是为了保证它是单峰的凸函数。
对于分多类的情况，每次训练一类，得到一个$h\_{\theta\_i}(\mathbf{X})$，然后求$argmax\\{i,h\_{\theta\_i}(\mathbf{X})\\}$就好了。

**高斯回归**
多维高斯回归由均值矢量和协方差矩阵决定：
$p(\mathbf{x};\boldsymbol{\mu,\Sigma}) = \frac{1}{(2\pi)^{\frac{n}{2}}|\boldsymbol{\Sigma}|^{\frac{1}{2}}}exp(-\frac{1}{2}(x-\boldsymbol{\mu})^T\boldsymbol{\Sigma}^{-1}(x-\boldsymbol{\mu}))$
公开课里面是用Anomaly Detection这个大例子带出的，$p(\mathbf{x};\boldsymbol{\mu,\Sigma})<\epsilon$为异常。应用于异常例子相当少的情况。应对方法是训练集全是“正常”。cv集有少部分“异常”，以训练合适的置信度参数$\epsilon$。

**Support Vector Machine**
SVM本身是建立在线性分类器上的。不过相较于逻辑回归用的sigmoid函数，SVM在超过一定界限就会直接为0了。类似：
$cost\_0(\boldsymbol{\theta}^T\mathbf{x}\_i) = \boldsymbol{\theta}^T\mathbf{x}\le{-1}\ ?\ -(\boldsymbol{\theta}^T\mathbf{x}+1)：0$。
用到的总cost function：
$J(\boldsymbol{\theta}) = -C\[\mathbf{y}^Tcost_0(\boldsymbol{\theta}^Tf(\mathbf{x}))+(\mathbf{1-y})^Tcost_1(\boldsymbol{\theta}^Tf(\mathbf{x}))\] + \frac{\lambda}{2}\(\boldsymbol{\theta}\_{-0})^{.2}$
这样相比于逻辑回归，可以保证分类的分界线与所分两类的距离最大(又称Large Margin Classifier)

为了解决线性不可分问题，引入核函数(也称similarity function)。核函数本质上是将输入之间的关系从低维空间投射到高维空间来看待，表现出的是$\mathbf{X\cdot X}\to\mathcal{ R}$。具体做法是将带有两个向量的式子（相减，相乘等），代入可以傅里叶转换为高维乃至无穷维函数的某个函数（投射函数），那么这个式子就相当于高维函数前面的系数。投射函数不变整个问题还是线性可解的。
上面$f(\mathbf{r})=\mathbf{r}$的是线性核。也可以用高斯核(也叫squared exponential kernel)：$exp(-\frac{\mathbf{r}^2}{2\sigma^2})$
相较于逻辑回归，适用于样本较少的情况。特征相比样本数数量越少，需要使用的核一般越复杂。

**神经网络**
![](http://i38.photobucket.com/albums/e127/gacjy/2014-10-26_20-46-57.jpg)
神经网络一般三种层：input，output，hidden(中间层)，联合而成一个非线性假设。hidden / output每个节点都有：
$a^{(i)}\_j=g(\boldsymbol{\theta}^{(i-1)}\_ja^{(i-1)})$，课程用$g(x)=sigmoid(x)$为例，称为sigmoid ***activation function***
用到的cost function：
$J(\boldsymbol{\theta}) = -\frac{1}{m}[\mathbf{Y}^Tlog(\mathbf{H}\_\theta(\mathbf{X}))+(\mathbf{1-Y})^Tlog(\mathbf{1-H}\_\theta(\mathbf{X}))] + \frac{\lambda}{2m}\sum\_{i=1}^{L-1}(\boldsymbol{\Theta}\_{-0})^.2$
调整方法是back propagation:
$\frac{\partial}{\partial\boldsymbol{\Theta}^{(l)}}J(\boldsymbol{\Theta})=\frac{1}{m}\sum\_i\mathbf{a}^{(l)}\boldsymbol{\delta}^{(l+1)}+\lambda\boldsymbol{\Theta\_{-0}}^{(l)}$，其中要递推求$\boldsymbol{\delta}^{(l)}=\boldsymbol{\Theta}^{(l)}\boldsymbol{\delta}^{(l+1)}$，$\boldsymbol{\delta}^{(L)}=\mathbf{y-a^{(L)}}$
可以用数学方法验证对错:
$\frac{d}{d\theta}J(\theta)\approx\frac{J(\theta+\epsilon)-J(\theta-\epsilon)}{2\epsilon}$
在开始训练之前要对所有$\Theta$在$\[-\epsilon,\epsilon\]$里面随机一下。如果全0初始化，会产生对称性，每个点的$\boldsymbol{\theta}$都一样的。
神经网络一般只有三层，hidden如有多层，各层的点数一般相同。
注意cost function和逻辑回归不同之处在，前一项要考虑多个output，后一项要考虑每一层的矩阵。

**协同过滤**
从recommender system引申出来的一类算法。推荐系统里面有user，有item，要预估user对item的评分，从而进行统计、分类和推荐。
对每个user建模，就有参数$\theta$需要训练。对每个item建模，建有参数$x$需要训练。
协同过滤的思想，就在于$\theta$和$x$可以轮流改进，或一起学习。
以线性回归代价函数为例，考虑两个代价函数合并
$J(\boldsymbol{\theta}) = \frac{1}{2m}(h\_\theta(\mathbf{X})-\mathbf{y})^.2 + \lambda(\boldsymbol{\theta}\_{-0})^.2$，$J(\boldsymbol{x}) = \frac{1}{2n}(h\_x(\mathbf{\Theta})-\mathbf{y})^.2 + \lambda(\boldsymbol{x}\_{-0})^.2$
有
$J(\boldsymbol{\Theta,X}) = \frac{1}{2}(\mathbf{X\Theta^T}-\mathbf{Y})^.2+ \frac{\lambda}{2}(\boldsymbol{X}\_{-0})^.2 + \frac{\lambda}{2}(\boldsymbol{\Theta}\_{-0})^.2$
所以参数随机初始化一下之后就可以像线性回归一样训练了。注意为了防止某行某列完全没有评分数据，必须整个矩阵进行mean normalization。

**参数调整**
线性回归中，如果$\alpha$太大，会overfitting，现象就是cost越来越大程序无法停止。太小又会跑得慢。
因此使用***Grid Search***，0.01, 0.03, 0.1, 0.3这样下去，直到回归速度足够快而又不过头。

##无监督学习
无监督学习的数据都是没有标号的，也就是没有拿来监督的$\mathbf{y}$。其学习目的是找出数据的潜在结构，比如做分类。

**K-Means**
算法伪代码如下:
```python
分类点向量mu随机化(分别选K个输入点作为分类点)
while (1):
    for i in range(N):
        x[i]的类别c[i] := 离x[i]最近的mu[i]的类别
    for i in range(N):
        mu[i] := 目前所有和mu[i]同类别的x[i]的均值
    if (mu前后差异小于置信值) break
```
要优化的cost function就是离各自中心距离的总和:
$J(c,\mu)=\frac{1}{m}\sum\_{i=1}^{m}|x-\mu\_{c^{(i)}}|^2$

为了保证算法不陷入局部最优值，最好是跑多几次选最优，保证不会被随机害死。
而要选择分类的数量K，一种方法是尝试过多个K后画出如下的图。图示“肘”位是最好的点。如果没有“肘”这种方法就无效了。
![](http://i38.photobucket.com/albums/e127/gacjy/QQ622A56FE20141103220649.png)

##整体策略
先用简单的算法，基础的数据集进行学习和分析，并检查错误点，看更多的数据、更多的特征、更复杂的模型和其他的预处理或是否有用，改进什么方向会更有效。

一般来说，对于人类专家本身能处理的问题，只要数据集够大，并使用相对复杂的模型，都会有不错的效果。

**输入前的处理**
各个特征值域不同，要做Feature Scaling与Mean Normalization:
$\mathbf{x'} = \frac{\mathbf{x}-\nu}{\mathbf{x\_{max}}-\mathbf{x\_{min}}} \approx \frac{\mathbf{x}-\nu}{s}$

为了减少运算量，压缩数据，画图分析，可以使用PCA方法降维。
> 协方差矩阵$\Sigma = \frac{1}{m}\mathbf{X^TX}$
> 用svd分解计算特征值 $[U, S, V] = svd(\Sigma)$ (因为$\Sigma$肯定是半正定矩阵)
> 新的输入集$Z = \sigma\_k(U)^TX$，其中$\sigma\_k(U)$是取$U$的前$k$列

将m维降至k维，核心思想是找到一个k维的平面，使输入集X所有点离平面距离总和(projection error)最小。
k应该选择满足$\frac{\frac{1}{m}\sum_{i=1}^m|x^{(i)}-x_{approx}^{(i)}|^2}{\frac{1}{m}\sum_{i=1}^{m}|x^{(i)}|^2}=1-\frac{\sum_{i=1}^kS_{ii}}{\sum_{i=1}^nS_{ii}}\le(1-置信度)$，保证方差基本不变。$S_{ii}$是svd分解中S对角线上的元素啦。$x_{approx}=\sigma\_k(U)Z$则是从PCA里面恢复的原值。
但是注意不要将PCA方法应用于缓解over-fitting的场合，因为regularization已经做得更好。而且最好是不用PCA不行(比如时间、内存不够)才应用PCA，否则用PCA挺浪费时间精力的。

注意Feature Scaling，Mean Normalization的参数，以及PCA的svd分解应该都只从训练集中获取。然后再把相同的映射运用到训练集，cv集和测试集中。

**大规模数据的计算**
主要思路是
> 1.将算法改进为每次只需要一组或几组输入来训练
> 2.利用map-reduce等大规模数据运算框架（其本质是牺牲排序和读写文件的时间，来切分数据并统筹整个计算机集群进行运算）来训练。

以gradient descent为例，batch gradient, mini-batch gradient, stochastic gradient **(待续)**

**对算法作评估及后续调整**
从训练集中：
取出一部分作为test set。以客观评估算法，预测在真实大规模数据中的准确度/置信度。
取出一部分作为cross validation set，如果除了训练以外还有东西要选择的话。如不同的超参、特征个数、模型等等。

一般的指标有方差等，统计学方面还有$R^2$，F检验等。
还有指标$Accuracy = \frac{所有分类准确的预测个数}{总样本个数}$
对于训练集中函数值偏向比较严重的情况(如分类中大多偏向于某一类)：
定义$Precison = \frac{某分类准确的预测个数}{同一分类的预测个数}$，$Recall=\frac{某分类准确的预测个数}{同一分类的实际样本个数}$（可理解为命中率和发现率），这两个没法做到同时很高
所以可以用$F\_1 = 2\frac{PR}{P+R}$进行评估

如果误差很大，排除模型的问题，除了调整超参（可训练参数之上的参数如$\lambda$），还可以尝试以下方法：
Overfitting(高variance): 去除冗余特征，获取更多训练集
Underfitting(高bias): 增加特征

训练模型的好坏，还可以通过Learning curve来进行诊断（否则只能降维画图了）：
![](http://i38.photobucket.com/albums/e127/gacjy/2014-10-30_21-05-22-1.jpg)
训练集的error会逐渐增加，cv集的error会逐渐减少，当两个函数比较平缓时，之间的间距太大就是高variance（同时说明还有训练空间），太小就是高bias。应该考虑采集数据的能力，来将间距提高到合适的位置。
可以考虑在已有真实数据的基础下，是否加上一定噪音能产生新的数据。特别是图像方面的问题。现在Amazon Mechanical Turk等地方也可以发布实验让人做采集数据。

通常来说，一个问题会在数据采集到模型训练的过程中有多个子阶段，可能还不止一个阶段用到了机器学习。可以运用ceiling analysis来分析改进空间。
具体做法就是从最开始顺序地、逐阶段地用真实数据代替该阶段的输出，每次统计整个系统的准确率。那么每阶段的改进空间就是$(本阶段被代替后准确率-本阶段被代替前准确率)$
（待续）

----------------
**符号说明**
点号表示逐元素运算，$\mathbf{x}^.2 = \\{x\_1^2,\ x\_2^2,\ \dots,\ x\_N^2\\}$
$X$输入矩阵，每行是一个输入矢量，size=(N\*M)，$y$采样值，size=(M\*1)，$\nu$均值

----------------
