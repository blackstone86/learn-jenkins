# GitHub仓库push后自动触发构建

## 步骤
- 安装插件
  - Git Plugin [文档](https://wiki.jenkins-ci.org/display/JENKINS/Git+Plugin#GitPlugin-Configuration)
  - GitHub Plugin [文档](https://wiki.jenkins-ci.org/display/JENKINS/GitHub+Plugin)
  - Plain Credentials Plugin [文档](https://wiki.jenkins-ci.org/display/JENKINS/Plain+Credentials+Plugin)

- 获取GitHub个人`access token` [创建GitHub access token](https://github.com/settings/tokens/new)
  - 填写创建access token的表单 
    - 填写`Token description`为jenkins_access_token
    - 选择`repo`和`admin:repo_hook`

      ![][githubCreatePersonalAccessToken]

  - 点击`Generate token`按钮

    ![][clickGenerateTokenBtn]

  - 成功创建后，复制`access token`
    
    ![][githubCreatePersonalAccessTokenSuccess]
  
- 在jenkins的系统配置页设置GitHub插件
    - 添加jenkins的GitHub认证，以便调用GitHub的api

      ![][addGithubServerCredentials]

    - `Kind`选择`Secret text`
      
      > 由于之前我们安装了`Plain Credentials Plugin`插件，所以会多了一个`Secret text`选项

      ![][selectSecretTextKind]

    - `Secret`填写刚才复制的GitHub`access token`
      
      ![][setCredentialsSecret]
      
    - `Credentials`选择`Secret text`
      
      ![][selectSecretText]

    - 测试jenkins连接GitHub服务器

      ![][checkCredentials]

      > 如成功，显示`Credentials verified for user blackstone86, rate limit: 4997`类似信息
  
  - 将本地jenkins服务发布到公网
    - [下载](https://ngrok.com/download)`ngrok`

      ![][downloadNgrok]

    - 解压到操作系统账户下

      ![][unzipToJimvin]

    - 打开终端，输入以下代码

      ```shell
      $ ./ngrok http 8080
      ```

      ![][runNgrok]

    - 成功发布后，会显示jenkins的公网地址
      
      ![][createLocalhostDomain]

  - 设置一下`Jenkins Location`(jenkins系统配置页)

    ![][jenkinsLocation]

    > 这个配置在邮件插件中会被使用到，让我们可以直接在jenkins发出的邮件中点击链接跳回去jenkins页面
      
  - github仓库创建一个服务
    - 点击`Add Service`按钮创建服务

      ![][addGithubService]

    - 选择`GitHub plugin`选项

      ![][selectJenkinsGithubPlugin]

    - 设置`Jenkins hook url`，将刚才发布的jenkins公网地址追加`/github-webhook/`字符串，并点击`Add Service`按钮

      ![][setGithubHookUrl]

    - 点击`Edit`按钮

      ![][editJenkinsPlugin]
    
    - 点击`Test Service`按钮

      ![][testService]
    
    - 服务正常会显示如下结果

      ![][successTestService]

  - 新建一个作业
    - 点击**新建**按钮

      ![][newProj]

    - 填写作业名为`jimvin-app`，并选择`构建一个自由风格的软件项目`选项，点击`ok`按钮进入下一步

      ![][createJimvinAappJob]

    - 复制github仓库链接
      
      ![][copyGithubRepoLink]

    - 设置作业的`GitHub project`配置，将刚才复制的github仓库链接黏贴到`Project url`
     
      ![][configGithubProj]

      > 提示：实际上`http://github.com/blackstone86/learn-jenkins.git`也是可以的，注意不要用`git@github.com:blackstone86/learn-jenkins.git`
      
      如果此时你保存作业配置，你会看到作业的左则菜单栏多了一个`GitHub`项目，点击会直接跳转到你github仓库界面

      ![][successConfigGithubProj]

    - 设置作业的Git配置，填写github仓库url
      
      ![][configGit]

    - 保存作业配置

      ![][saveJobConfig]

  - push代码变更到`https://github.com/blackstone86/learn-jenkins.git`仓库，并查看jenkins运行状况
    - 作业被自动触发构建

      ![][autoCi]
    
    - 作业构建后，点击作业号链接，进入作业详细页

      ![][lookupJob]
    
    - 默认显示`状态集`

      > 提示：下图中的`Started by GitHub push by blackstone86`说明本次构建是由blackstone86推送代码变更到github而触发的

      ![][lookupStatus]
    
    - 查看`Console Output`控制台输出

      ![][lookupConsole]
   
    - 查看`变更记录`

      ![][lookChanglog]

      > 提示：`16513df84dc55f7d7643146deec58ec8f9b50acc`、`ci_by_webhook.md`、`diff`都会直接跳转到github对应的界面，`blackstone86`是代码变更的提交者，点击显示其git的邮箱地址

## 总结
   到此为止，我们介绍了在jenkins中如何创建一个作业，如何通过github的push事件通知jenkins自动触发作业的构建，但是并没有设置构建和构建后的操作，接下来将讲解如何书写构建脚本，以及如何设置构建后的操作

[githubCreatePersonalAccessToken]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/github_create_personal_access_token.png
[clickGenerateTokenBtn]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/click_generate_token_btn.png
[githubCreatePersonalAccessTokenSuccess]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/github_create_personal_access_token_success.png
[addGithubServerCredentials]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/add_github_server_credentials.png
[selectSecretTextKind]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/select_secret_text_kind.png
[setCredentialsSecret]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/set_credentials_secret.png
[selectSecretText]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/select_secret_text.png
[checkCredentials]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/check_credentials.png
[newProj]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/new_proj.png
[createJimvinAappJob]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/create_jimvin_app_job.png
[copyGithubRepoLink]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/copy_github_repo_link.png
[configGithubProj]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/config_github_proj.png
[successConfigGithubProj]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/success_config_github_proj.png
[configGit]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/config_git.png

[downloadNgrok]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/download_ngrok.png
[unzipToJimvin]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/unzip_to_jimvin.png
[runNgrok]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/run_ngrok.png
[createLocalhostDomain]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/create_localhost_domain.png

[jenkinsLocation]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/jenkins_location.png

[addGithubService]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/add_github_service.png
[selectJenkinsGithubPlugin]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/select_jenkins_github_plugin.png
[setGithubHookUrl]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/set_github_hook_url.png
[editJenkinsPlugin]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/edit_jenkins_plugin.png
[testService]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/test_service.png
[successTestService]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/success_test_service.png
[successTestService]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/success_test_service.png
[saveJobConfig]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/save_job_config.png

[autoCi]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/auto_ci.png 
[lookupJob]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/lookup_job.png 
[lookupStatus]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/lookup_status.png 
[lookupConsole]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/lookup_console.png 
[lookChanglog]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/look_changlog.png


