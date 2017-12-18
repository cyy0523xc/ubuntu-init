#!/bin/bash
# 
# 


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

cd /var/www/src/github.com/ibbd/dev-vim
bash install-YoucompleteMe.sh
bash install.sh
bash install-color.sh

cd -
echo "install ok."
