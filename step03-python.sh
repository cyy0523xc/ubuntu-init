#!/bin/bash
# 
# python基础安装配置
# Author: alex
# Created Time: 2017年12月17日 星期日 00时13分13秒

# install 最新版本Python
update=0
if which python3; then
    if 
        python3 -V|grep 3.6
    then
        echo "python3.6 is install."
    elif 
        python3 -V|grep 3.5
    then
        echo "python3.5 is install."
    else
        update=1
    fi
else 
    update=1
fi

if [ $update = 1 ]; then
    version=3.6.7
    sudo aptitude -y install gcc make zlib1g-dev
    wget https://www.python.org/ftp/python/$version/Python-$version.tar.xz
    tar xJf Python-$version.tar.xz
    cd Python-$version
    ./configure
    make
    make install
fi

# which python3
v_msg=`python3 -V`
r_msg="Python $version"
if [ ! "$v_msg" = "$r_msg" ]; then 
    echo "version is not right!"
    echo "ln -s /usr/local/bin/python3.6 /usr/bin/python3"
    exit 1
fi

# ipython
sudo apt-get install -y ipython3 

# pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
sudo -H python3 get-pip.py --user --force-reinstall

# fire: 命令行工具
sudo -H pip install -U pip \
    numpy \
    pandas \
    jieba \
    scipy \
    nltk \
    cython \
    sphinx \
    sphinx_rtd_theme \
    Cython \
    flask flask_restful \
    fire \
    sqlalchemy \
    hdf5 \
    beautifulsoup \
    protobuf \
    cloudpickle \
    dill \
    pyinstaller 

sudo -H pip3 install git+https://github.com/ibbd-dev/python-fire-rest.git

echo "请手动安装以下工具："
echo "使用sql查询csv: https://github.com/harelba/q"
