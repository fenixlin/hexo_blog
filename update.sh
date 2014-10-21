#!/bin/bash

# use "hexo init" to create a new hexo repository in a folder
# DON'T forget to use "npm install" then

# use "hexo new __name__" to create a new post

# use "hexo server" at the root to view it on local web browser

hexo clean
hexo generate
hexo deploy

git add -A
git commit -a
git push -u origin master
