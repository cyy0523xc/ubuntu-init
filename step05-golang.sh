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

set_env() {
    echo "$1" | sudo tee -a /etc/bash.bashrc
    echo "$1" | sudo tee -a /etc/zsh/zshenv
}


# 配置GOPATH  配置PATH
# 这些配置最好启动时自动加载了
# vim /etc/profile
bashrc=/etc/profile
zshrc=/etc/zsh/zshenv
if [ "$GOROOT" = "$goroot" ]; then
    echo "The config of go path is ok!"
else
    set_env ""
    set_env "# golang$version config. date: "`date`
    set_env "export GOROOT=$goroot"
    set_env "export GOPATH=/var/www"
    set_env "export PATH=$path:\$PATH"
    echo "往文件$bashrc 和 $zshrc加入了内容"
fi

echo "ok"
echo "查看go版本的命令：go version"
echo "查看相关环境变量：go env"

