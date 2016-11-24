# 邮件通知（以Gmail为例）

## 步骤
- 在jenkins系统配置页配置`邮件通知`，设置`SMTP服务器`、`用户默认邮件后缀`，设置后点击`高级`按钮
  
  ![][emailBase]

- 参照下图填写`SMTP认证`
  
  ![][emailAdvance]

  > 提示：`用户名`填写你的Gmail邮箱地址，`密码`填写邮箱登陆密码

- 选中`通过发送测试邮件测试配置`，`Test e-mail recipient`填写你的Gmail邮箱地址，点击`Test configuration`按钮
  
  ![][emailTest]

  如果测试通过，显示如下
    
  ![][successEmailTest]

  去自己的Gmail查看jenkins发过来的测试邮件

  ![][checkEmail]

  邮件内容

  ![][checkEmailDetail]

  如果测试**不通过**，出现`javax.mail.AuthenticationFailedException`异常
      
  ![][errorEmailTest]

  去[设置](https://www.google.com/settings/security/lesssecureapps)Google账号访问权限，选择`启用`

  editGoogleAccess

  > 提示：出现`javax.mail.AuthenticationFailedException`异常是因为Google认为jenkins是不够安全的应用，此处选择`启用`的目的是让jenkins具备
    访问Google账号的权限，包括Gmail  

[emailBase]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/email_base.png
[emailAdvance]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/email_advance.png
[emailTest]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/email_test.png
[successEmailTest]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/success_email_test.png
[checkEmail]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/check_email.png
[checkEmailDetail]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/check_email_detail.png
[errorEmailTest]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/error_email_test.png
[editGoogleAccess]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/edit_google_access.png

