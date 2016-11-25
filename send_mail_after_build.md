# 构建后操作之发送邮件

## 步骤
- 安装插件 
  - Mailer [文档](https://wiki.jenkins-ci.org/display/JENKINS/Mailer)

- 设置构建后发送邮件通知

  ![][emailSetting]

  `单独发送邮件给对构建造成不良影响的责任人`中的“责任人”的邮件，jenkins是从Git提交信息中的邮箱地址收集起来的
   
   ![][blackstone86User]

   ![][jimvin86User]

   ![][asianking86User]

   以上三次提交后，jenkins会检测`blackstone86`、`jimvin86`、`asianking86`三个用户是否已经存在同名的用户，如果存在，则忽略，不会覆盖原有的同名用户，如果不存在则创建新的，由于我之前并没有这三个同名用户，所以你会在jenkins用户列表发现新增了三个用户，如下：

   ![][jenkinsUsers]

   > 提示：只要让jenkins与github建立联系，提交代码变更会自动触发jenkins构建，此时jenkins会在没有同名用户情况下动态创建新用户，但这些新的用户的`用户标识`、`名称`来源没有规律可循
   
  |git作者|git邮箱|用户标识来源|名称来源|
  |---|:---|:---:|---:|
  |blackstone86|jimvin@hudongpai.com|git邮箱|git作者|
  |blackstone888|jimvin86@gmail.com|git邮箱前缀|git邮箱前缀|
  |asianking86|asianking86@qq.com|git作者或git邮箱前缀|git作者或git邮箱前缀|   

   一旦出现构建失败，jenkins将会发送构建失败邮件通知到以下邮箱地址

   `Recipients` 指定的邮箱地址列表
   - blackstone8866 <blackstone8866@gmail.com>

   责任人邮箱地址列表
   - Jimvin <jimvin@hudongpai.com>
   - jimvin86 <jimvin86@gmail.com>
   - Asianking86 <asianking86@qq.com>

   在QQ邮箱查看jenkins发过来的构建失败通知邮件

   ![][sendMailCount]

   如果不勾选`单独发送邮件给对构建造成不良影响的责任人`，则只会发送到`Recipients` 指定的邮箱地址列表

- 邮件的发送时机
  - 构建失败`Failed`时候
    
    >提示：邮件标题类似`Build failed in Jenkins: jimvin-app #57`

  - 构建从失败`Failed`变成非稳定状态`Unstable`时
    
    或

    构建从失败`Failed`变成非稳定状态`Success`时
   
    ![][becomeToNormal]

    >提示：邮件标题类似`Jenkins build is back to normal : jimvin-app #60`

  - 构建从失败`Failed`->非稳定状态`Unstable`->成功状态`Success`时

    或

    构建从失败`Failed`->非稳定状态`Unstable`->非稳定状态`Unstable`时

    或

    构建从失败`Failed`->非稳定状态`Unstable`->非稳定状态`Unstable`->成功状态`Success`时

    ![][normalToStable]

    >提示：邮件标题类似`Jenkins build is back to stable : jimvin-app #61`

- 不发送邮件情况
  - 当出现构建失败后，一旦出现连续两次成功状态`Success`，则第二次成功构建后就不再发送邮件通知了，后续的构建只要不失败，都不会发邮件
  - 从成功状态`Success`变成非稳定状态`Unstable`，不会发邮件
  


[emailSetting]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/email_setting.png
[asianking86User]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/asianking86_user.png
[jimvin86User]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/jimvin86_user.png
[blackstone86User]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/blackstone86_user.png
[jenkinsUsers]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/jenkins_users.png
[sendMailCount]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/send_mail_count.png
[becomeToNormal]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/become_to_normal.png
[normalToStable]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/normal_to_stable.png