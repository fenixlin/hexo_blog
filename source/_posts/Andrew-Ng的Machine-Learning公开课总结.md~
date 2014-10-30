title: Andrew Ng的Machine Learning公开课总结
tags:
  - Machine Learning
date: 2014-10-18 20:55:18
catagories:
---

Tom Mitchell(1998)指出机器学习最重要的三个概念：Task（概括性的目标……），Performance(衡量指标)，Experience(训练过程)
这门课上提到的算法都是静态的。只着眼于一次采样。要通过一次训练尽可能好地拟合真实函数。
训练的过程，一般是通过最优化***cost function***来实现。
为简洁起见以下不说明任何符号含义，最后才附上说明。

##有监督学习
有监督学习可以做分类和估值。

**线性回归**
线性回归已经假设真实函数(目标函数)是线性的。
$h\_\theta(\mathbf{x}\_i) = \boldsymbol{\theta}^T\mathbf{x}\_i$ ， $\mathbf{h\_\theta(X)} = \boldsymbol{X\theta}$
用到的cost function:
$J(\boldsymbol{\theta}) = \frac{1}{2m}(h\_\theta(\mathbf{X})-\mathbf{y})^.2 + \lambda(\boldsymbol{\theta}\_{-0})^.2$
最优化cost方法1 —— 多次***gradient descent***求解:
$\boldsymbol{\theta'} = \boldsymbol{\theta}-\alpha\frac{\partial}{\partial\boldsymbol{\theta}}J(\boldsymbol{\theta}) = \boldsymbol{\theta}-\alpha\frac{1}{m}(\mathbf{X}(h\_\theta(\mathbf{X})-\mathbf{y})+\lambda\boldsymbol{\theta}\_{-0})$
最优化cost方法2 —— 数学方法***normal equation***:
$\boldsymbol{\theta} = (\mathbf{X}^T\mathbf{X}+\lambda\mathbf{1}\_{-0})^{-1}\mathbf{X}^T\mathbf{y}$

线性回归是估值用的。$\lambda(\boldsymbol{\theta}\_{-0})^.2$项是为了避免Overfitting。
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


**参数调整**
线性回归中，如果$\alpha$太大，会overfitting，现象就是cost越来越大程序无法停止。太小又会跑得慢。
因此使用***Grid Search***，0.01, 0.03, 0.1, 0.3这样下去，直到回归速度足够快而又不过头。

##处理方法
各个特征值域不同，要做Feature Scaling与Mean Normalization:
$\mathbf{x'} = \frac{\mathbf{x}-\nu}{\mathbf{x\_{max}}-\mathbf{x\_{min}}}$
Overfitting: 去除冗余特征，再调整参数

----------------
**符号说明**
点号表示逐元素运算，$\mathbf{x}^.2 = \\{x\_1^2,\ x\_2^2,\ \dots,\ x\_N^2\\}$
$X$输入矩阵，每行是一个输入矢量，size=(N\*M)，$y$采样值，size=(M\*1)，$\nu$均值

----------------

