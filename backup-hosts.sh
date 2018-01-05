#!/bin/bash
# 
# 加密备份hosts文件
# 密码：姓名与QQ号
# Author: alex
# Created Time: 2017年12月18日 星期一 17时35分40秒

openssl aes-128-cbc -salt -in /etc/hosts -out ./config/hosts

