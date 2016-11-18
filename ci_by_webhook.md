# GitHub仓库push后自动触发构建

## 步骤
- 安装插件
  - Git Plugin [文档](https://wiki.jenkins-ci.org/display/JENKINS/Git+Plugin#GitPlugin-Configuration)
  - GitHub Plugin [文档](https://wiki.jenkins-ci.org/display/JENKINS/GitHub+Plugin)
  - Plain Credentials Plugin [文档](https://wiki.jenkins-ci.org/display/JENKINS/Plain+Credentials+Plugin)

- 获取GitHub服务器认证，以便调用GitHub的api
  - 获取GitHub个人`access token`
    - 创建access token [创建](https://github.com/settings/tokens/new)
      
      填写`Token description`为jenkins_access_token，选择`repo`和`admin:repo_hook`

      ![][github_create_personal_access_token]
    
    - 点击`Generate token`按钮

      ![][click_generate_token_btn]
    
    - 成功创建后，复制`access token`
      
      ![][github_create_personal_access_token_success]
   
  - 在jenkins的系统配置页设置GitHub插件
    - 添加jenkins的GitHub认证

      ![][add_github_server_credentials]

    - `Kind`选择`Secret text`
       
      ![][select_secret_text_kind]

    - `Secret`填写刚才复制的GitHub`access token`
      
      ![][set_credentials_secret]
      
    - `Credentials`选择`Secret text`
      
      ![][select_secret_text]

    - 测试jenkins连接GitHub服务器

      ![][select_secret_text]

      > 如成功，显示`Credentials verified for user blackstone86, rate limit: 4997`类似信息

[github_create_personal_access_token]: https://help.github.com/assets/images/help/settings/github_create_personal_access_token.png
[click_generate_token_btn]: https://help.github.com/assets/images/help/settings/click_generate_token_btn.png
[github_create_personal_access_token_success]: https://help.github.com/assets/images/help/settings/github_create_personal_access_token_success.png
[add_github_server_credentials]: https://help.github.com/assets/images/help/settings/add_github_server_credentials.png
[select_secret_text_kind]: https://help.github.com/assets/images/help/settings/select_secret_text_kind.png
[set_credentials_secret]: https://help.github.com/assets/images/help/settings/set_credentials_secret.png
[select_secret_text]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/select_secret_text.png
[check_credentials]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/check_credentials.png