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

    ![][SetJenkinsFullnameImgage]

  - 更改**Jenkins**用户密码

    ![][SetJenkinsPwdImgage]
    
## 用**Jenkins**用户登陆
  - 注销当前系统账户
  - 选择**Jenkins**用户登陆（我们之前创建的Jenkins用户）

## 获取`初始密码`
  - 打开终端，输入下面代码
    
    ```shell
    cat Home/secrets/initialAdminPassword
    ```
  - 将密码记住（比如，用Evernote保存一下）

## 用自己账户登陆
  - 注销当前系统账户
  - 选择自己账户登陆

## 登陆jenkins界面
  - 打开 http://localhost:8080
  - 输入`初始密码`，解锁jenkins
    ![][UnlockJenkinsImgage]
  - 选择安装官方推荐插件
    ![][CustomizeJenkinsImgage]
  - 创建第一个jenkins管理员账户

    ![][AddAdminUserImgage]

    jenkins就绪

    ![][JenkinsReadyImgage]
    
    进入jenkins界面

    ![][JenkinsOkImgage]
  
## 卸载jenkins

  打开终端，输入下面代码

  ```shell
  sudo '/Library/Application Support/Jenkins/Uninstall.command'
  ```

## 进阶
  - [GitHub仓库push后自动触发构建](https://github.com/blackstone86/learn-jenkins/blob/master/ci_by_webhook.md)
  - [邮件通知（以Gmail为例）](https://github.com/blackstone86/learn-jenkins/blob/master/mail_notification.md)

## 参考资源
  - GitHub SSH相关
    - [检查已有的SSH钥匙](https://github.com/blackstone86/learn-jenkins/blob/master/github_ssh_key_check.md)
    - [生成一个新的SSH钥匙](https://github.com/blackstone86/learn-jenkins/blob/master/github_ssh_key_generate.md)
    - [添加SSH钥匙到ssh-agent](https://github.com/blackstone86/learn-jenkins/blob/master/github_ssh_key_to_sshagent.md)
    - [添加SSH钥匙到GitHub账户](https://github.com/blackstone86/learn-jenkins/blob/master/github_ssh_key_add.md)
   
[ButlerImage]: https://jenkins.io/sites/default/files/jenkins_logo.png
[CustomizeJenkinsImgage]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/customize_jenkins.png
[SetJenkinsFullnameImgage]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/set_jenkins_fullname.png
[SetJenkinsPwdImgage]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/set_jenkins_pwd.png
[AddAdminUserImgage]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/add_admin_user.png
[JenkinsReadyImgage]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/jenkins_ready.png
[JenkinsOkImgage]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/jenkins_ok.png
[UnlockJenkinsImgage]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/unlock_jenkins.png
[website]: https://jenkins.io/
