#!/bin/bash
# 
# 恢复hosts文件
# Author: alex
# Created Time: 2017年12月18日 星期一 17时53分35秒

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

