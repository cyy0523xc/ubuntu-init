#!/bin/bash
# 
# 加密备份hosts文件
# 密码：姓名与QQ号
# Author: alex
# Created Time: 2017年12月18日 星期一 17时35分40秒

echo "正在备份host文件："
echo "密码使用姓名和QQ号相关的："
openssl aes-128-cbc -salt -in /etc/hosts -out ./config/hosts

