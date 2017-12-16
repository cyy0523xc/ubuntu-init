#!/bin/bash
# 
# 配置第二步: 同步github的项目
# @author Alex Cai
# 

email="cyy0523xc@gmail.com"
if [ ! -d ~/.ssh ]; then
    echo "请先生成ssh key，并将key保存到github上。生成命令如下："
    echo "ssh-keygen -t rsa -b 4096 -C \"$email\""
    exit 1
fi

cd /var/www/github.com/cyy0523xc
git clone git@github.com:cyy0523xc/md2html
git clone git@github.com:cyy0523xc/code
git clone git@github.com:cyy0523xc/dict_build
cd -


cd /var/www/github.com/ibbd
git clone git@github.com:IBBD/dev-vim
git clone git@github.com:IBBD/dockerfile-dgraph
git clone git@github.com:IBBD/dockerfile-spacy
git clone git@github.com:IBBD/dockerfile-node
git clone git@github.com:IBBD/dockerfile-elk
git clone git@github.com:IBBD/dockerfile-mariadb
git clone git@github.com:IBBD/dockerfile-nginx
git clone git@github.com:IBBD/dockerfile-php-fpm
git clone git@github.com:IBBD/dockerfile-php7-fpm
git clone git@github.com:IBBD/IBBD.github.io
cd -

cd /var/www/github.com/ibbd-dev
git clone git@github.com:ibbd-dev/ibbdETL
git clone git@github.com:ibbd-dev/TextGrocery
cd -

echo 'ok'
