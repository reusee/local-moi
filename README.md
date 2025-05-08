## 使用说明

### prepare.sh

这个脚本会安装 debootstrap，以及在 root 目录构造文件系统模板

如果宿主系统不是 fedora，可以改成其他方式安装 debootstrap

中间会要求设置 root 密码。这个是新系统的 root 密码，和宿主系统无关

### 配置

运行 run.sh 之前，需要修改 config 文件

MO_DIR 指向 matrixone 仓库本地路径

MOI_DIR 指向 matrixflow 仓库本地路径

### run.sh

这个脚本会以当前 root 目录为模板，创建一个新的根文件系统，并启动

新系统的根文件系统在单独的目录，命名是 root-$(date -Isec)

MO_DIR, MOI_DIR 会被加载到 /root 目录

对加载的目录的修改，不会影响宿主机器上的目录

在新系统环境下，按住 ctrl，再按三下 ']' 键，可以退出

退出之后，文件系统不会删除，可以再次通过 ./run.sh [dir] 启动

root-* 目录如果不需要了，可以直接删除

## 工作原理

systemd-nspawn 的 --template 参数，会以参数值为模板，创建一个文件系统的快照，作为新系统的根目录，并结合多个 --overlay 参数，将代码仓库加载到新系统的 /root 目录下，然后通过 systemd service，启动各个服务

新系统的所有文件，都是基于快照或者 overlayfs，所以任何修改，都不会影响到宿主系统的文件，实现环境的隔离

