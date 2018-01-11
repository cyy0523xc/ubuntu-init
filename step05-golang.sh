#!/bin/bash
# 
# golang环境安装与配置
# Author: alex
# Created Time: 2017年12月17日 星期日 00时13分44秒

# 需要安装的golang版本
version=1.9.2
base=1.4.3
# golang安装目录
gopath=/var/www/golang
goroot=$gopath/go-go$version/
path=$gopath/go-go$version/bin

if [ ! -d "$gopath" ]; then
    mkdir $gopath
fi

sudo apt-get install gcc libc6-dev

# 安装1.4.2版本
# 直接./all.bash安装报错：unknown relocation type 42; compiled without -fpic?
if [ ! -d $gopath/go-go$base ]; then
    cd $gopath
    if [ ! -f $gopath/go$base.zip ]; then
        echo "从github上下载文件，可能比较耗时"
        wget https://github.com/golang/go/archive/go$base.zip
        if [ $? -ne 0 ]; then
            echo "Error: wget https://github.com/golang/go/archive/go$base.zip"
            exit 1
        fi
    fi
    unzip go$base.zip
    cd go-go$base/src
    if [ ! -f all.bash ]; then
        echo "$base: all.bash不存在"
        exit 1
    fi

    if 
        env CGO_ENABLED=0 ./make.bash;
    then
        echo "Install go$base succ!"
    else
        echo "Install go$base fail!"
        exit 1
    fi
fi

# 配置$GOROOT_BOOTSTRAP
export GOROOT_BOOTSTRAP=$gopath/go-go$base

# 安装最新版golang
cd $gopath
if [ ! -f go$version.zip ]; then
    echo "从github上下载文件，可能比较耗时"
    wget https://github.com/golang/go/archive/go$version.zip
    if [ $? -ne 0 ]; then
        echo "Error: wget https://github.com/golang/go/archive/go$version.zip"
        exit 1
    fi
fi
if [ ! -d go-go$version ]; then
    unzip go$version.zip
fi
cd go-go$version/src
if [ ! -f all.bash ]; then
    echo "$version: all.bash不存在"
    exit 1
fi
if 
    bash all.bash;
then
    echo "Install go$verion succ!"
else
    echo "Install go$verion fail!"
    exit 1
fi

bashrc=/etc/bash.bashrc
zshrc=/etc/zsh/zshenv
set_env() {
    # 设置环境变量
    if [ -f "$bashrc" ]; then
        # bash shell
        if 
            grep "$1" "$bashrc";
        then
            echo "$1: config had in $bashrc"
            exit 1
        fi
        echo "$1" | sudo tee -a "$bashrc"
    fi
    if [ -f "$zshrc" ]; then
        # zsh shell
        if 
            grep "$1" "$zshrc";
        then
            echo "$1: config had in $zshrc"
            exit 1
        fi
        echo "$1" | sudo tee -a "$zshrc"
    fi
}


# 配置GOPATH  配置PATH
# 这些配置最好启动时自动加载了
# vim /etc/bash.bashrc
# vim /etc/zsh/zshenv
if [ "$GOROOT" = "$goroot" ]; then
    echo "The config of go path is ok!"
else
    set_env ""
    set_env "# golang$version config. date: "`date`
    set_env "export GOROOT=$goroot"
    set_env "export GOPATH=/var/www"
    set_env "export PATH=/var/www/bin/:$path:\$PATH"
    echo "往文件$bashrc 和 $zshrc加入了内容"
fi

# 配置golang
mkdir -p /var/www/src/golang.org/x/
cd /var/www/src/golang.org/x/
git clone https://github.com/golang/tools
git clone https://github.com/golang/text
git clone https://github.com/golang/crypto

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

echo "ok"
echo "查看go版本的命令：go version"
echo "查看相关环境变量：go env"

