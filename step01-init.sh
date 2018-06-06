#!/bin/bash
# 
# ubuntu系统初始化使用
# @author cyy0523xc@gmail.com
#

# 用户名
username=`whoami`
hostname='alex'
email='cyy0523xc@gmail.com'

# install基础软件
sudo apt install -y git \
    vim vim-gnome \
    jq \
    rar \
    curl \
    htop \
    zeal \
    tmux \
    guake \
    nload \
    terminator \
    silversearcher-ag \
    chromium-browser \
    apt-transport-https \
    ca-certificates \
    software-properties-common \
    openssh-server \
    pandoc \
    trash-cli

# install zsh
sudo apt install -y zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
chsh -s $(which zsh)

# install docker
echo "install pinta ..."
sudo add-apt-repository ppa:pinta-maintainers/pinta-stable
sudo apt-get update -y
sudo apt-get install -y pinta

# 配置
echo "Begin config..."
sudo mkdir -p /var/www/src/git.ibbd.net
sudo mkdir -p /var/www/src/github.com/cyy0523xc
sudo mkdir -p /var/www/src/github.com/ibbd
sudo mkdir -p /var/www/src/github.com/ibbd-dev
sudo chown -R $username:$username /var/www
git config --global user.email "$email"
git config --global user.name "$username"
git config --global push.default simple

# 配置bashrc
if [ -f ~/.bashrc ]; then
    if 
        cat ~/.bashrc|grep "alias rm='rm -i'"
    then
        echo "\"alias rm='rm -i'\" is ok"
    else
        echo "# 给rm命令增加确认" >> ~/.bashrc
        echo "alias rm='rm -i'" >> ~/.bashrc
    fi

    if 
        cat ~/.zshrc|grep "alias rm='rm -i'"
    then
        echo "\"alias rm='rm -i'\" is ok"
    else
        echo "# 给rm命令增加确认" >> ~/.zshrc
        echo "alias rm='rm -i'" >> ~/.zshrc
    fi
fi

# 修改hostname
echo "修改hostname"
echo $hostname | sudo tee /etc/hostname
sudo hostname $hostname

# 创建ssh key
echo "创建ssh key的命令："
echo "ssh-keygen -t rsa -b 4096 -C \"$email\""
echo "将key加到github.com和git.ibbd.net上"
echo "也可以将 ./config/ssh.20180311.zip 文件解压到相应目录下，密码使用名字与QQ号相关的。"

