title: Hello, Hexo Blog!
tags:
- hexo
date: 2014-10-14 21:09:28
catagories: hexo
---
呼呼，一直想搭个博客，但是一直太懒了=.=...还跑到jekyll bootstrap那里去走了一些弯路。直到发现了Hexo。实在太赞！

下面就写一下搭建Hexo博客的主要流程好了。顺便给自己备忘备忘。
**因为是回忆用，所以博客文章写得会尽可能地精简，直白，不拘小节，向当年[Matrix67超牛的5000字总结](http://www.matrix67.com/blog/archives/90)看齐。各种总结也会是以后主题。会中文这种冗余超低的语言，总结起来真的是超幸福的好嘛！**
哈哈，不过会尽可能地说浅显的啦！
希望能够一直坚持吧！这个过程不免漫长而痛苦。不过这一年的面试经验说明，不努力一下，遗忘曲线两年就会到底的啦！**甚至可以遇见我研究生之后找工作的最大担心就是本科的知识丢得差不多了吧= =ｂ**当年信息安全实验课漏掉了的笔记和程序真是让我超级超级心痛啊啊啊TAT！

<!--more-->

# git设置
1. 安装git，弄好SSH登录。
``` bash
$ sudo apt-get install git git-core git-doc git-gui
$ ssh-keygen -t rsa -C "fenixlin@yandex.com"
```
放置id_rsa.pub到github.com(个人设置页就有)
``` bash
$ ssh -T git@github.com
$ git config --global user.name "fenixlin"
$ git config --global user.email "fenixlin@yandex.com"
```
2. 常用的github命令(创建目录时要在网页里创建):
``` bash
$ git clone https://github.com/fenixlin/hexo_blog
$ git init
$ git status	#对比commit看现在修改了什么文件
$ git pull
$ git add -A	#添加所有文件
$ git commit -a	#如果用--amend就可以补漏，和上一次commit合并
$ git remote add origin https://github.com/fenixlin/hexo_blog
$ git remote    #查看已存储的远程git地址
$ git push -u origin master
$ git reset --soft __commitID__		#回滚到__commitID__的commit，之后再git commit -m就好了，新内容也会合并
$ git mergetool		#一个用来合并diff的可视化工具
$ git checkout __branch name__　　　　#切换所在分支(还有创建/比对等功能)
$ git checkout __file name__    #恢复file到上次commit状态
$ git checkout -f   #恢复所有文件到上次commit状态
$ git branch    #查看所在分支
$ git log    #查看git历史。git reflog可以查看包括删除了的commit。
$ git cherrypick __commitID__   #将其他分支的commit应用到当前分支。
```
另外，编辑.gitignore可以忽略匹配其某行的文件，对所有人生效。而.git/info/exclude则只是对本开发者生效


# Hexo下载与设置

我是在Ubuntu 14.04下面上传的。外面Windows的教程偏多，就不赘述了。

安装node.js。下面是官网推荐的方法。
``` bash
$ wget -qO- https://raw.github.com/creationix/nvm/master/install.sh | sh
$ sudo nvm install 0.10
```
我好像是以前在nodejs直接下载的。所以也可以下载好之后
``` bash
$ ./configure
$ make
$ sudo make install
```
然后
``` bash
$ sudo npm install -g hexo
```
找一个目录
``` bash
$ hexo init
$ npm install
```
博客更新(之前要在_config.yml设置好)
``` bash
$ hexo clean
$ hexo generate
$ hexo deploy
```
写博客(模板在scaffolds/post.md)
``` bash
$ hexo new post __博客名字__
```
博客模板目前用的是[Yilia](http://litten.github.io/2014/08/31/hexo-theme-yilia/)
很赞，不赘述。更新是themes/yilla下git pull


##最后瞎掰一下博客的计划
毕竟沉淀下来的，能够教得会别人的，才是自己的东西啊。有空了突然就有了写博客的愿望。
最近会写的
- Machine Learning的课程总结
- C, C++, Java， 函数式语言的思想总结对比
- Verilog的总结
- ACM接触到的一些算法
- 嵌入式的总结
- 编译原理／操作系统／数据库一些理论性的总结

希望顺利吧。
也向看完这篇博客的所有同学问好！
