#!/bin/bash
# 
# ubuntu系统初始化使用
# @author cyy0523xc@gmail.com
#

# 用户名
username=`whoami`

# install基础软件
sudo apt install -y git \
    vim \
    zsh \
    jq \
    rar \
    curl \
    guake \
    terminator \
    silversearcher-ag \
    chromium-browser \
    apt-transport-https \
    ca-certificates \
    software-properties-common \
    openssh-server

# install docker
echo "install docker, pinta ..."
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
sudo add-apt-repository ppa:pinta-maintainers/pinta-stable

sudo apt-get update -y
sudo apt-get install -y docker-ce
sudo apt-get install -y pinta

# 配置
echo "Begin config..."
sudo mkdir -p /var/www/git.ibbd.net
sudo mkdir -p /var/www/github.com/cyy0523xc
sudo mkdir -p /var/www/github.com/ibbd
sudo mkdir -p /var/www/github.com/ibbd-dev
sudo chown -R $username:$username /var/www
git config --global user.email "cyy0523xc@gmail.com"
git config --global user.name "Alex Cai"


# 创建ssh key
echo "创建ssh key的命令："
echo "ssh-keygen -t rsa -b 4096 -C \"cyy0523xc@gmail.com\""
echo "将key加到github.com和git.ibbd.net上"

echo "Init end."
