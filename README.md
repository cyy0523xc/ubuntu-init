# ubuntu-init
重装系统时初始化系统使用

## 目录结构

目录结构采用与Golang兼容的方式，`GOPATH=/var/www`，源码目录`/var/www/src/`

```
# $GOPATH = /var/www

bin/
    mathapp
pkg/
    平台名/ 如：darwin_amd64/linux_amd64
        mymath.a
        github.com/
            astaxie/
                beedb.a
src/
    mathapp
        main.go
    mymath/
        sqrt.go
    github.com/
        astaxie/
            beedb/
                beedb.go
                util.go
```

## Golang跨平台编译镜像

```sh
docker pull karalabe/xgo-latest
```

## python机器学习相关

### 计算

* numpy (http://www.numpy.org/): 数值计算
* pandas (https://pandas.pydata.org/): 基于numpy的数据分析工具
* numexpr (https://github.com/pydata/numexpr): 简单易用的Numpy性能提升工具
* scipy (https://www.scipy.org/): 科学计算库, 如插值，积分，优化，图像处理，统计等
* scikit-learn (http://scikit-learn.org/stable/): 机器学习框架
* scikit-image (http://scikit-image.org/): 数字图片处理库
* sympy (http://www.sympy.org/en/index.html): 符号运算库, 如多项式求值、求极限、解方程、求积分、微分方程、级数展开、矩阵运算等
* patsy (https://patsy.readthedocs.io/en/latest/): 
* statsmodel (http://www.statsmodels.org/stable/index.html): 统计模型
* numba (https://numba.pydata.org/): 高性能运算库

### 深度学习

* tensorflow
* pytorch
* keras
* opencv
* dlib
* gluoncv

### 可视化

* matplotlib (https://matplotlib.org/): 数据可视化工具
* seaborn (https://seaborn.pydata.org/): 数据可视化
* bokeh (https://bokeh.pydata.org/en/latest/): 交互式可视化库
* vincent (http://vincent.readthedocs.io/en/latest/): D3可视化
* Facets (https://github.com/PAIR-code/facets): 数据特征可视化

### 相关库

* cython (http://cython.org/): 编译python扩展库
* cloudpickle (https://github.com/cloudpipe/cloudpickle): 序列化工具
* dill (https://pypi.python.org/pypi/dill): 序列化工具
* sqlalchemy (https://www.sqlalchemy.org/): 
* hdf5 (http://www.h5py.org/): 数据存储格式
* beautifulsoup (https://www.crummy.com/software/BeautifulSoup/): 爬虫工具
* protobuf (https://developers.google.com/protocol-buffers/docs/pythontutorial): 数据交换标准
* xlrd (http://www.python-excel.org/): 操作Excel数据

