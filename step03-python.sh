#!/bin/bash
# 
# python基础安装配置
# Author: alex
# Created Time: 2017年12月17日 星期日 00时13分13秒

sudo apt-get install -y ipython3 python3-pip

sudo -H pip3 install -U pip \
    numpy \
    pandas \
    jieba \
    scipy \
    nltk \
    sphinx \
    sphinx_rtd_theme
