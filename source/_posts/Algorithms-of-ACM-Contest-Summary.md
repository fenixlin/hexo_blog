title: Algorithms of ACM Contest Summary
tags:
  - Algorithm
  - Summary
date: 2015-03-22 20:55:37
catagories:
---
*(2015/04/10 更新动态规划，网络流，STL)*

四五年没有再去好好温习ACM方面的东西了，不过这一块其实时不时还是会提到，姑且做个简陋的算法方面的总结吧~时间精力有限，能总结多少是多少了。
这里写法同样是"复习用"。[NOCOW](http://www.nocow.cn/index.php/%E9%A6%96%E9%A1%B5)会比我说得更加详细清楚:P

##动态规划(背包/博弈/树状/字符串/状态压缩等)
动态规划，核心在于定义"状态"及"状态转移方程"。
<!--more-->

**背包**
有限空间内放置各种价值不同资源(物品)的最优值问题。这个问题[崔添翼大牛](https://github.com/tianyicui/)在《背包九讲》里面讲得超清楚，简单概括一下好了。

1.  01背包：各种物品只有一件。$F[i,v]=max\\{F[i-1,v],F[i-1,v-C\_i]+W\_i\\}$，即选择取或不取。循环每件物品时，如倒序扫描DP数组，可以降低一维空间复杂度。
2.  完全背包：各种物品无限件。$F[i,v]=max\\{F[i-1,v],F[i,v-C\_i]+W\_i\\}$。01背包改成顺序扫描DP数组就可以了。预处理去掉明显性价比低的物品，能进一步优化。
3.  多重背包：各种物品$M\_i$件。$F[i,v]=max\\{F[i-1,v-kC\_i]+kW\_i\\},0\le k\le M\_i$。可以将$M\_i$拆分成二进制表示的多件物品，进行01背包，优化复杂度。*单调队列优化容后补充*
4.  多维背包：以上问题扩展到多维有限空间。二维为例，$F[i,v,u]=max\\{F[i-1,v,u],F[i-1,v-C\_i,u-D\_i]+W\_i\\}$，多一重循环就好了，比如二维01背包就两重倒序扫描。
5.  分组背包：以上问题的物品分组，每组最多取一件。$F[k,v]=max\\{F[k-1,v],F[k-1,v-C\_i]+W\_i\\},i\in 组k$。先循环组，再倒序扫描DP数组每次取组内一件。
6.  有依赖的背包：以上问题选用物品要满足依赖关系，依赖关系是一个森林。由于每一个节点及其儿子都有$2^k$种选择，这相当于多次背包的结果再合并的问题。就用树状DP的方法，从叶子开始，每一个节点都进行一次01背包减少选择。

其他技巧：

*   定义状态，可以定义"花费刚好为v时的最优值"和"花费至多为v时的最优值"两种；
*   记录最优方案，则开多一个数组记录来源状态，及状态转移选择(如果来源状态不暗含的话)；
*   求方案总数，最小值等，则将max改成sum、min；
*   求第K优解，则在状态数组中多开一维(就是每个状态变一个队列)，记录前K优解。

**博弈**
博弈论的状态一般是很明显的，关键是要从胜负状态反推状态转移方程。

*   SG博弈：最经典的是NIM游戏。【待补充】。参见[这里](http://blog.csdn.net/logic_nut/article/details/4711489)

**树状**
一般从子节点开始归纳状态转移。这方面的总结太杂乱，【待补充】。

**序列/字符串**

*   最大子矩阵 悬线法
*   KMP
*   Sunday(http://blog.csdn.net/WINCOL/article/details/4795369)

**插头**
二维平面，对连通性有要求，逐格进行状态转移的DP，并且每个格子的状态需要进行压缩。
压缩方法包括：
1. 连通的格子用同一标号表示。
2. 路线不能交叉，标号只用两个就够。
3. 扩大成使用$2^k$进制，位运算来转移
见[PPT](http://wenku.baidu.com/view/4fe4ac659b6648d7c1c74633.html)

**相关优化**

*   滚动数组：因为动态规划方程中，最外层循环每次往往只需要用到上一次循环的数据，所以只开能够存下两次大循环的空间就好，而不是全部循环的空间。
*   状态压缩：
*   单调队列：一般应用于状态转移中，要求旧状态带有"最大/最小"条件的问题。关键是发现可以抛弃掉的、更老的状态，作为单调队列可抛弃的状态。对于有区间限制的题目，可以将{状态值，状态位置}对建成单调双端队列，左限制右求最值。每次状态转移时就可以从单调队列中提取，而不必往前扫描。没有区间限制求第k大/k小的题目，若发现了可抛弃的状态，亦可构建一个单调序列，用二分查找提取(最长不下降子序列)。[见此总结](http://www.cnblogs.com/neverforget/archive/2011/10/13/ll.html)
*   优先队列/堆优化：

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
优化后的求最大流算法。每次先BFS建立层次图(离源点距离i的点在第i层)，然后DFS逐层递归找一条增广路(能增加流量的路径，流量为路径中权值最小的边)，然后增广值加入总流量，并把整条增广路反向。循环至汇点不能到达。动画及代码见[这里](http://comzyh.com/blog/archives/568/)。
**SAP**
**Hungarian**

##数据结构(包括线段树等)

**Monotonic Queue**
一个双端队列，左边抛掉不符合新条件的旧元素，右边新元素入队时抛掉不能保持单调性的。
能够求最大最小/k大k小问题。经常被用于优化动态规划算法。
**Segmentation tree**
**Disjoint Set**
数组记录的树，记录父节点及子树元素个数。
1. 查找：递归查找出树根a，然后沿路将父节点全部置为a
2. 合并：要合并的两个节点分别查找出树根a,b，然后元素少的树根a父节点置为b
**BST**
**Splay**
**Treap**
**AVL**
**Red-Black**
**SBT**
**Binary Heap**
**Leftist Heap**
**Fibonacci Heap**

##数学&几何(凸包等)

##思路/基本功(二分答案/贪心/搜索/排序等)

**排序算法**

ACM非常少用到，姑且就当算法课基础复习了

*   Insertion
*   Bubble
*   Shell
*   Quick
*   Heap
*   Merge
*   Radix
*   Bin

**C++ STL**
虽然STL和算法无关，但是由于STL的存在，很多数据结构不用自己写，是ACM比赛中必备外挂……

容器：操作包括begin, end, rbegin, rend, erase(,), clear
**1. 标准序列容器**：
`list<>` `vector<>` `deque<>`，内存分配分别是连续，小片连续，不连续。
常用操作（各类略有出入请自行琢磨，下同）: empty, front, back, push\_front(), push\_back(), pop\_front, pop\_back, max\_size, reverse, insert(,,), remove(), remove\_if(), assign(,), swap(), at(), unique, sort

**2. 标准关联容器**：
`set<>` `multiset<>` `map<,>` `multimap<,>`，对应集合，可重复集合，一对一映射，一对多映射。红黑树实现。


**3. 容器适配器**：
标准序列容器变种，提供受限的底层容器接口，没有迭代器
`queue<int>` `queue<int,list<int>>`，默认deque作为底层容器，包括操作push,pop,front,back,empty,size
`priority_queue<int>` `priority_queue<int, vector<int>, greater<int>>`，默认使用vector作为底层容器，包括操作top,push,pop,empty,size
`stack<>`
**4. 似容器**：
`string<>` `valarray<>` `bitset<>`
**5. 容器迭代器**：
`vector<int>::iterator` `vector<int>::const_iterator`

算法：
1. 以下内容需要`#include <algorithm>`
sort(begin,end,cmp), 相比c的qsort，用的是intro_sort，不会退化
2. 以下内容需要`#include <functional>`
greater<> 【待补充】[见这里](http://www.baidu.com/s?ie=utf8&oe=utf8&wd=C%2B%2B%20greater&tn=90128732_hao_pg&ch=2&lans=132),[以及这里](http://wenku.baidu.com/link?url=FQ_M_OG2UgNqJLngZgSQlAeek-0B21j9QoMkvUgrmdq9W1TWoqotNGEvVUuqDn1NdqsBMmntGyyPcsDMj3gVJsLhCRolj2OZxBTnkc0-2Ii)
less<>
