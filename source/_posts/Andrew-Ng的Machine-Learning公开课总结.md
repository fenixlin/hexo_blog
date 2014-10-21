title: Andrew Ng的Machine Learning公开课总结
tags:
  - Machine Learning
date: 2014-10-18 20:55:18
catagories:
---
Tom Mitchell(1998)指出机器学习最重要的三个概念：Task（概括性的目标……），Performance(衡量指标)，Experience(训练过程)

这门课上提到的算法都是静态的。只着眼于一次采样，不必考虑动态的多次采样的获取函数。

单次采样来说，就要通过训练尽可能好地拟合原真实函数。训练的过程，一般是通过最优化代价函数(cost function)来实现。

##有监督学习
有监督学习可以做分类和估值。
###线性回归
线性回归已经假设真实函数(目标函数)是线性的。
$$ h_\theta(\mathbf{x_i}) = \mathbf{\theta}^T\mathbf{x}_i + \mathbf{\epsilon} $$

用到的cost function:

$$ J(\mathbf{\theta}) = \frac{1}{2m}\sum_{i=1}^{m}(h_\theta(\mathbf{x_i})-\mathbf{y}_i)^2 $$
