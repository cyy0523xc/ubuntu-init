#!/bin/bash
# 
# 安装golang相关的packages
# Author: alex
# Created Time: 2018年03月11日 星期日 12时19分48秒

if 
    go env
then
    echo "go install ok. begin to install packages:"
    echo
else
    echo "go install fail!!"
    exit 1
fi

# 配置golang
mkdir -p /var/www/src/golang.org/x/
cd /var/www/src/golang.org/x/
git clone https://github.com/golang/tools
git clone https://github.com/golang/text
git clone https://github.com/golang/crypto
git clone https://github.com/golang/net
git clone https://github.com/golang/sys
git clone https://github.com/golang/lint

# vim-go
go get github.com/klauspost/asmfmt/cmd/asmfmt
go get github.com/alecthomas/gometalinter
go get golang.org/x/tools/cmd/guru
go get golang.org/x/tools/cmd/goimports
go get golang.org/x/tools/cmd/gorename
go get github.com/golang/lint/golint
go get github.com/zmb3/gogetdoc
go get github.com/fatih/motion
go get github.com/kisielk/errcheck
go get github.com/nsf/gocode
go get github.com/jstemmer/gotags
go get github.com/josharian/impl
go get github.com/fatih/gomodifytags
go get github.com/dominikh/go-tools/cmd/keyify

# 常用的golang package
go get github.com/gin-gonic/gin
go get github.com/spf13/cobra
go get github.com/go-sql-driver/mysql

echo "ok"
echo "查看go版本的命令：go version"
echo "查看相关环境变量：go env"

