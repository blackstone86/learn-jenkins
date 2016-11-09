[![][ButlerImage]][website]

# jenkins使用总结

## 安装
- [下载最新package](http://mirrors.jenkins.io/osx/latest)
- 点击安装jenkins-x.xx.pkg

## 创建Jenkins用户
 - 设置Jenkins用户为**管理员**
 ```shell
  sudo dseditgroup -o edit -a jenkins -t user admin
 ```

 - 添加Jenkins用户到**开发组**
 ```shell
  sudo dscl . append /Groups/_developer GroupMembership jenkins
 ```

## 设置Jenkins用户
  - 进入`系统偏好设置\用户与群组`
  - 点击左下角**锁**，输入**当前用户**的**登陆密码**解锁
  - 在用户列表中选择**Jenkins**用户 **注意:** 名称为空的就是Jenkins用户
  - 点击**Jenkins**用户并按**control**键，进入`高级选项`，设置**全名**为Jenkins
  - 更改**Jenkins**用户密码

## 用**Jenkins**用户登陆
  - 重启电脑
  - 选择**Jenkins**用户登陆

## 获取`初始密码`
  - 打开`/Users/Shared/Jenkins/Home/secrets/initialAdminPassword`获取

## 用自己账户登陆
  - 重启电脑
  - 选择自己账户登陆

## 登陆jenkins界面
  - 打开 http://localhost:8080
  - 输入`初始密码`
  - 选择安装官方推荐插件
    ![][CustomizeJenkinsImgage]
  - 创建第一个jenkins账户，即可进入jenkins界面


[ButlerImage]: https://jenkins.io/sites/default/files/jenkins_logo.png
[CustomizeJenkinsImgage]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/customize_jenkins.png
[website]: https://jenkins.io/
