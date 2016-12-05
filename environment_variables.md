# 环境变量

## 插件环境变量
- Git Plugin 环境变量
  - $GIT_COMMIT
    
    当前提交的完整SHA散列码

    输出例子：`02159eb63d503d562b83c2326fd4e531a6d75a0d`

  - $GIT_BRANCH
    
    远程仓库名称（默认`origin`)，紧跟当前分支名称

    输出例子：`origin/master`

  - $GIT_PREVIOUS_COMMIT

    上一次提交的完整SHA散列码

    输入例子：`bf29c6ae90539721a0d8c601ef98300362a04a5d`

  - $GIT_PREVIOUS_SUCCESSFUL_COMMIT

    上一次成功提交的完整SHA散列码

    输出例子：`bf29c6ae90539721a0d8c601ef98300362a04a5d`

  - $GIT_URL
    
    远程仓库URL

    输出例子：`https://github.com/blackstone86/learn-jenkins.git`

  - $GIT_AUTHOR_NAME（等价于$GIT_COMMITTER_NAME）

    提交人名称

    输出例子：`jimvin`

  - $GIT_AUTHOR_EMAIL（等价于$GIT_COMMITTER_EMAIL）

    提交人邮箱地址

    输出例子：`jimvin@hudongpai.com`

  > 提示：$GIT_AUTHOR_NAME，$GIT_COMMITTER_NAME，$GIT_AUTHOR_EMAIL，$GIT_COMMITTER_EMAIL这些变量都来源于配置，
    - 配置方式一：系统配置页设置
      
    - 配置方式二：作业配置页设置

[configGitPlugin]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/config_git_plugin.png    
[configGitPlugin2]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/config_git_plugin_2.png    