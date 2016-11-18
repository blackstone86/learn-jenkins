# GitHub仓库push后自动触发构建

## 步骤
- 安装插件
  - Git Plugin [文档](https://wiki.jenkins-ci.org/display/JENKINS/Git+Plugin#GitPlugin-Configuration)
  - GitHub Plugin [文档](https://wiki.jenkins-ci.org/display/JENKINS/GitHub+Plugin)
  - Plain Credentials Plugin [文档](https://wiki.jenkins-ci.org/display/JENKINS/Plain+Credentials+Plugin)

- 获取GitHub服务器认证，以便调用GitHub的api
  - 获取GitHub个人`access token` [创建](https://github.com/settings/tokens/new)
    - 填写创建access token的表单 
      - 填写`Token description`为jenkins_access_token
      - 选择`repo`和`admin:repo_hook`

        ![][githubCreatePersonalAccessToken]
    
    - 点击`Generate token`按钮

      ![][clickGenerateTokenBtn]
    
    - 成功创建后，复制`access token`
      
      ![][githubCreatePersonalAccessTokenSuccess]
   
  - 在jenkins的系统配置页设置GitHub插件
    - 添加jenkins的GitHub认证

      ![][addGithubServerCredentials]

    - `Kind`选择`Secret text`
       
      ![][selectSecretTextKind]

    - `Secret`填写刚才复制的GitHub`access token`
      
      ![][setCredentialsSecret]
      
    - `Credentials`选择`Secret text`
      
      ![][selectSecretText]

    - 测试jenkins连接GitHub服务器

      ![][checkCredentials]

      > 如成功，显示`Credentials verified for user blackstone86, rate limit: 4997`类似信息

[githubCreatePersonalAccessToken]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/github_create_personal_access_token.png
[clickGenerateTokenBtn]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/click_generate_token_btn.png
[githubCreatePersonalAccessTokenSuccess]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/github_create_personal_access_token_success.png
[addGithubServerCredentials]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/add_github_server_credentials.png
[selectSecretTextKind]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/select_secret_text_kind.png
[setCredentialsSecret]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/set_credentials_secret.png
[selectSecretText]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/select_secret_text.png
[checkCredentials]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/check_credentials.png