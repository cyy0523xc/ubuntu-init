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

cd -
echo "install ok."
