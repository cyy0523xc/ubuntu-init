#!/bin/bash
# 
# golang环境安装与配置
# Author: alex
# Created Time: 2017年12月17日 星期日 00时13分44秒

# 需要安装的golang版本
version=1.9.4
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

echo "请手动配置bash/zsh的配置文件"
echo "# golang$version config. date: "`date`
echo "export GOROOT=$goroot"
echo "export GOPATH=/var/www"
echo "export PATH=/var/www/bin/:$path:\$PATH"
echo "往文件 $bashrc 和 $zshrc 加入了内容"
echo 
echo "配置好之后，执行安装packages"
