# 构建后操作之发送邮件

## 步骤
- 安装插件 
  - Mailer [文档](https://wiki.jenkins-ci.org/display/JENKINS/Mailer)

- 配置构建后发邮件

  ![][emailSetting]

  `单独发送邮件给对构建造成不良影响的责任人`中的“责任人”的邮件，jenkins是怎样收集的：
     
   从Git提交信息中的邮箱地址配置获取

   ![][asianking86User]

   ![][jimvin86User]

   ![][blackstone86User]

   以上两次提交后，jenkins会检测`asianking86`、`jimvin86`、`jimvin`三个用户是否已经存在同名的用户，如果存在，则忽略，不会覆盖原有的同名用户，如果不存在则创建新的，由于我之前并没有这三个同名用户，所以你会在jenkins用户列表发现新增了三个用户，如下：

   ![][jenkinsUsers]

   一旦出现构建失败，jenkins将会发送给以下用户

   `Recipients` 指定的邮箱地址列表
   - blackstone8866 <blackstone8866@gmail.com>

   责任人邮箱地址列表
   - jimvin86 <jimvin86@gmail.com>
   - Jimvin <jimvin@hudongpai.com>
   - Asianking86 <asianking86@qq.com>

   在QQ邮箱查看jenkins发过来的构建失败通知邮件

   ![][sendMailCount]

[emailSetting]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/email_setting.png
[asianking86User]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/asianking86_user.png
[jimvin86User]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/jimvin86_user.png
[blackstone86User]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/blackstone86_user.png
[jenkinsUsers]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/jenkins_users.png
[sendMailCount]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/send_mail_count.png