title: Hexo博客，早晨！
tags:
- hexo
date: 2014-10-14 21:09:28
catagories: hexo
---
呼呼，一直想搭个博客，但是一直太懒了=.=...还跑到jekyll bootstrap那里去走了一些弯路。直到发现了Hexo。实在太赞！

下面就写一下搭建Hexo博客的主要流程好了。顺便给自己备忘备忘。
**因为是回忆用，所以博客文章写得会尽可能地精简，直白，不拘小节，向当年Matrix67超牛的5000字总结看齐。各种总结也会是以后主题。**
哈哈，不过会尽可能地说浅显的啦！
希望能够一直坚持吧！这个过程不免漫长而痛苦。不过这一年的面试经验说明，不努力一下，遗忘曲线两年就会到底的啦！


# git设置
1. 安装git，弄好SSH登录。
``` bash
$ sudo apt-get install git git-core git-doc git-gui
$ ssh-keygen -t rsa -C "lazylazyowl@gmail.com"
```
放置id_rsa.pub到github.com(个人设置页就有)
``` bash
$ ssh -T git@github.com
$ git config --global user.name "lazyowl"
$ git config --global user.email "lazylazyowl@gmail.com"
```
2. 常用的github命令(创建目录时好像不得不上网创):
``` bash
$ git clone https://github.com/lazyowl/hexo_blog
$ git init
$ git status
$ git add -A
$ git commit -a
$ git remote add origin https://github.com/lazyowl/hexo_blog
$ git push -u origin master
```

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
很赞，不赘述。


##最后瞎掰一下博客的计划
毕竟沉淀下来的，能够教得会别人的，才是自己的东西啊。有空了突然就有了写博客的愿望。
最近会写的
- Machine Learning的课程总结
- C, C++, Java的思想总结对比
- Verilog的总结

希望顺利吧。
也向看完这篇博客的所有同学问好！
