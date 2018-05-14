#!/bin/bash
# 
# 

# ctags
sudo apt-get install exuberant-ctags 

if [ ! -d /var/www/src/github.com/ibbd ]; then
    mkdir -p /var/www/src/github.com/ibbd
    cd /var/www/src/github.com/ibbd
    git clone git@github.com:ibbd/dev-vim
    if [ $? -ne 0 ]; then
        echo "git clone error!"
        echo "cd /var/www/github.com/ibbd"
        echo "git clone git@github.com:ibbd/dev-vim"
        exit 1
    fi
fi

install() {
    if 
        $*
    then
        echo "Install $2 ok."
    else
        echo "Install $2 error."
        exit 1
    fi
}

cd /var/www/src/github.com/ibbd/dev-vim
install bash install-YoucompleteMe.sh
install bash install.sh
install bash install-color.sh

# install vim-anywhere
echo "Install vim-anywhere..."
sudo apt-get install xclip
curl -fsSL https://raw.github.com/cknadler/vim-anywhere/master/install | bash
# ~/.vim-anywhere/update
echo "如果ctrl+alt+v快捷键不起作用，则需要在系统设置->键盘里手动设置快捷键，执行脚本："
echo "$HOME/.vim-anywhere/bin/run"
echo "使用的时候，先ctrl+alt+v调出gvim进行编辑，编辑好之后，:wq退出保存到缓冲区，然后使用ctrl+v粘贴即可。"

cd -
echo "install ok."
