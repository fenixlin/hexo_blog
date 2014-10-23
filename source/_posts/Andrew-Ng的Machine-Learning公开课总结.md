title: Andrew Ng的Machine Learning公开课总结
tags:
  - Machine Learning
date: 2014-10-18 20:55:18
catagories:
---

#有监督学习
有监督学习可以做分类和估值。
##线性回归
线性回归已经假设真实函数(目标函数)是线性的。
`\[h_\theta(\mathbf{x_i}) = \mathbf{\theta}^T\mathbf{x_i} + \mathbf{\epsilon}\]`
用到的cost function:
`\[J(\mathbf{\theta}) = \frac{1}{2m}\sum_{i=1}^{m}(h_\theta(\mathbf{x_i})-\mathbf{y_i})^2\]`
对于规模比较大的数据，需要多次gradient descent求解:
`\[\mathbf{\theta'} = \mathbf{\theta}-\alpha\frac{\partial}{\partial\mathbf{\theta}}J(\mathbf{\theta})\]`
解同样可用数学方法***normal equation***获得，但计算逆矩阵要$O(n^3)$，还要保证特征之间独立才会有逆矩阵，计算量大，适合数据量小的情况，或者做验证用:
`\[\mathbf{\theta} = (\mathbf{X}^T\mathbf{X})^{-1}\mathbf{X}^T\mathbf{y}\]`


##逻辑回归
就是给回归函数套一个函数，保证值域是[0,1]:
`\[h_\theta(\mathbf{x_i}) = sigmoid(\mathbf{\theta}^T\mathbf{x_i} + \mathbf{\epsilon})\]`
其中sigmoid如下，就是斜s型的一个函数，z=0时刚好是0.5。
`\[sigmoid(z) = \frac{1}{1+e^{-z}}\]`
相应地cost function也要作出改变，才能是单峰的凸函数：
`\[J(\theta) = -\frac{1}{m}[\sum_{i=1}^{m}\mathbf{y}logh_\theta(\mathbf{x})]\]`

##参数调整
线性回归中，如果$\alpha$太大，会overfitting，现象就是cost越来越大程序无法停止。太小又会跑得慢。
因此使用***Grid Search***，0.01,0.03,0.1,0.3这样下去，直到回归速度足够快而又不过头。

