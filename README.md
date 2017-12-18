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

