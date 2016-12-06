# 环境变量

## jenkins环境变量
  
## 插件环境变量
- Git Plugin 环境变量
  - $GIT_COMMIT
    
    当前提交的完整SHA散列码

    输出例子：`02159eb63d503d562b83c2326fd4e531a6d75a0d`

    > 提示：如果本地提交多次，然后再push到远程仓库，那么`$GIT_COMMIT`显示最近一次提交的SHA散列码

  - $GIT_BRANCH
    
    远程仓库名称（默认`origin`)，紧跟当前分支名称

    输出例子：`origin/master`
  
  - $GIT_LOCAL_BRANCH
    
    在作业对应的项目创建并检出该分支

    输出例子：`master`

    > 提示：需要在作业配置页设置
      
    ![][configGitPluginBranch]

    ![][configGitPluginBranch2]

    设置为空字符串，或者`**`，会显示`master`

    如果设置为非空字符串，且非`**`，则显示为对应的设置值，如设置为`sandbox`，则显示为`sandbox`

    以`jimvin-app`作业为例，对应的项目如下所示

    ![][jimvinAppSource]

    验证是否检出`sandbox`分支，打开终端，输入以下代码

    ```shell
    cd /Users/Shared/Jenkins/Home/workspace/jimvin-app
    git branch
    ```
    
    显示当前分支为`sandbox`

    ![][checkJimvinAppBranch]

  - $GIT_PREVIOUS_COMMIT

    上一次触发构建的提交的完整SHA散列码

    输出例子：`bf29c6ae90539721a0d8c601ef98300362a04a5d`

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
      
      ![][configGitPlugin]

    - 配置方式二：作业配置页设置

      ![][configGitPlugin2]

    > 提示，如果两种方式都有设置，则以`配置方式二`的为准 

[configGitPlugin]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/config_git_plugin.png    
[configGitPlugin2]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/config_git_plugin_2.png    
[configGitPluginBranch]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/config_git_plugin_branch.png    
[configGitPluginBranch2]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/config_git_plugin_branch2.png   
[jimvinAppSource]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/jimvin_app_source.png   
[checkJimvinAppBranch]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/check_jimvin_app_branch.png   