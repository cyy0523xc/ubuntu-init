#!/bin/bash
# 
# python graph安装配置
# Author: alex
# Created Time: 2017年12月17日 星期日 00时13分13秒

# python实现，性能比较低
sudo -H pip install networkx

# igraph, 底层使用c实现，Python实现的接口
sudo apt-get install libxml2-dev
sudo -H pip install python-igraph

