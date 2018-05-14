#!/bin/bash
# 
# python基础安装配置
# Author: alex
# Created Time: 2017年12月17日 星期日 00时13分13秒

sudo apt-get install -y ipython3 

# pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo -H python3 get-pip.py --user --force-reinstall

# fire: 命令行工具
sudo -H pip install -U pip \
    numpy \
    pandas \
    jieba \
    scipy \
    nltk \
    sphinx \
    sphinx_rtd_theme \
    Cython \
    flask flask_restful \
    fire

echo "请手动安装以下工具："
echo "使用sql查询csv: https://github.com/harelba/q"
