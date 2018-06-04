#!/bin/bash
# 
# 恢复hosts文件
# Author: alex
# Created Time: 2017年12月18日 星期一 17时53分35秒

echo "[注意]正在恢复host文件:"
echo "[提示]密码使用姓名和QQ号相关的:"
output=./config/hosts-output
if 
    openssl aes-128-cbc -d -salt -in ./config/hosts -out "$output"
then
    sudo mv "$output" /etc/hosts
    if [ -f "$output" ]; then
        rm -f "$output"
    fi
else
    echo "解密失败"
    exit 1
fi

