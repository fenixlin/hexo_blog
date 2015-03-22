title: Algorithms of ACM Contest Summary
tags:
  - Algorithm
  - Summary
date: 2015-03-22 20:55:37
catagories:
---
*2015/03/22 更新图论*

四五年没有再去好好温习ACM方面的东西了，不过这一块其实时不时还是会提到，姑且做个简陋的算法方面的总结吧~
这里写法同样是"复习用"。[NOCOW](http://www.nocow.cn/index.php/%E9%A6%96%E9%A1%B5)会比我说得更加详细清楚:P

##动态规划(背包/树状/字符串状态压缩等)
**KMP**

<!--more-->

##树与图论(最短路/生成树等)
**Adjacency List**

![](http://i57.tinypic.com/2czavls.jpg)

**Dijkstra**

正权图单源最短路，以贪心为基础。维护一个数组，记录源点到每个点当前已知最短路边权和，初始除了源点全为无穷大。循环V次，每次取数组中的最小值，即为到该对应点的最短路。$O(V^2)$

*   也可以用邻接表保存边，维护一个二叉堆而不是数组。$O((E+V)logV)$

**Bellman-ford**

任意图单源最短路。遍历V-1次边集进行松弛。如果遍历后还有边可以松弛，则存在负权环。$O(VE)$

**SPFA**
用队列优化Bellman-ford算法。一开始只有源点在队列中。每次循环遍历队头的点的邻边，所有被松弛的点加入队列。如果某个点的入队次数超过V，则存在负权环。

设最短路边权和为dist[i]   

*   SLL优化：对于要入队的元素i，队首j，若$dist[i] < dist[j]$，i插入队首； 
*   LLL优化：队首j，若$dist[j] < average(dist[])$，j延至队尾处理； 

核心思路是提前可能更优的松弛。加上两个优化平均可提速50%。

**Floyd-warshall**

任意图多源最短路，动态规划为基础。维护一个邻接矩阵，三重循环，每次以对角线的点为中心作十字用v[i,k]+v[k,j]更新v[i,j]。$O(V^3)$

**Prim**

任意图的最小生成树算法。维护一个数组，记录每个"已到点"连接某个"未到点"的最小边权。循环V次，每次取数组中的最小值，对应边即为最小生成树树枝，对应点加入"已到点"。$O(V^2)$

*   也可以用邻接表保存边，维护一个二叉堆而不是数组，但写这个不如写Kruskal。$O((E+V)logV)$

**Kruskal**

任意图的最小生成树算法。边集按权值从小到大排序逐条尝试加入解，并维护一个并查集以保证不形成环路，直到成功加入V-1条边。$O(VlogV+ElogE)$

**Kosaraju**

有向图求强连通分支(任意点相互可达)的算法。先DFS一次记录访问顺序，然后所有边取反，逆访问顺序多次DFS，每次DFS到的点即为一个强连通分支。

*   类似的算法还有Tarjan和Gabow，不过时间复杂度的优化并不算太大，暂时不写啦

##网络流(二分图匹配等)
**Ford-Fulkerson**
**Edmonds-Karp**
**Dinic**
**Hungarian**

##数据结构(包括线段树等)
**Disjoint Set**
**BST**
**Splay**
**Segmentation tree**
**Treap**
**AVL**
**SBT**
**Binary Heap**
**Leftist Heap**
**Fibonacci Heap**

##数学&几何(凸包等)

##思路/基本功(二分答案/贪心/搜索/排序等)

###排序算法
ACM非常少用到，姑且就当算法课基础复习了
**Insertion**
**Bubble**
**Shell**
**Quick**
**Heap**
**Merge**
**Radix**
**Bin**
