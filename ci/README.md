# ci 模板使用


## 0 项目使用此模板

##### 安装更新模板辅助脚本
```
rm -rf 99.00002.openos365.template.install.sh

wget https://ghproxy.com/raw.githubusercontent.com/openos365/openos365-00002-ci-github-actions-template/main/99.00002.openos365.template.install.sh

chmod +x 99.00002.openos365.template.install.sh
sudo cp -fv 99.00002.openos365.template.install.sh /usr/bin/99.00002.openos365.template.install.sh


```

##### 在需要的项目下面执行赓勋安装模板脚本

```
99.00002.openos365.template.install.sh 
```

## 1 最简单的情况模板 使用ubuntu-latest环境执行shell

* TODO 1 初始化模板
```
./0.template.init.sh 1
```
* TODO 2 修改 `1.ci.shell.runner.sh`

## 2 使用特定的容器环境执行shell

* TODO 1初始化模板
```
./0.template.init.sh 2
```
* TODO 2 设定运行容器镜像名称
* TODO 3 修改自定义脚本

* TODO 2 设定运行容器


## 2 进行docker构建

* 初始化模板

```
./0.template.init.sh 3
```