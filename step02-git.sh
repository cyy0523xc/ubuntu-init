#!/bin/bash
# 
# 配置第二步: 同步github的项目
# @author Alex Cai
# 

# 配置
email="cyy0523xc@gmail.com"

if [ ! -d ~/.ssh ]; then
    echo "请先生成ssh key，并将key保存到github上。生成命令如下："
    echo "ssh-keygen -t rsa -b 4096 -C \"$email\""
    exit 1
fi

path=/var/www/src/github.com
git-clone() {
    project="$path/$1"
    if [ ! -d "$project" ]; then
        mkdir -p "$project"
    fi

    cd "$project"
    if 
        git clone "git@github.com:$1/$2"
    then
        echo "git clone git@github.com:$1/$2   => ok"
    else
        echo "git clone git@github.com:$1/$2   => error"
        exit 1
    fi
}

git-clone cyy0523xc md2html
git-clone cyy0523xc code
git-clone cyy0523xc dict_build

git-clone ibbd dev-vim
git-clone ibbd dockerfile-dgraph
git-clone ibbd dockerfile-spacy
git-clone ibbd dockerfile-node
git-clone ibbd dockerfile-elk
git-clone ibbd dockerfile-mariadb
git-clone ibbd dockerfile-nginx
git-clone ibbd dockerfile-php-fpm
git-clone ibbd dockerfile-php7-fpm
git-clone ibbd IBBD.github.io

git-clone ibbd-dev ibbdETL
git-clone ibbd-dev TextGrocery

echo 'ok'
