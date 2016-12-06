# 环境变量

## jenkins环境变量
  - $BUILD_NUMBER
    
    构建序号

    输出例子：`102`

  - $BUILD_ID
    
    构建ID

    输出例子：`102`
  
  - $BUILD_DISPLAY_NAME

    构建名称

    输出例子：`#102`

  - $JOB_NAME

    作业名称

    输出例子：`jimvin-app`

  - $JOB_BASE_NAME

    作业名称

    输出例子：`jimvin-app`

  - $BUILD_TAG

    构建标签，格式"jenkins-${JOB_NAME}-${BUILD_NUMBER}"

    输出例子：`jenkins-jimvin-app-102`

  - $EXECUTOR_NUMBER

    作业执行者（理解成执行作业的线程）的唯一数字标识，该标识基于1

    输出例子：`1`

    > 提示：常规来讲，不同作业会对应不同的`EXECUTOR_NUMBER`，但是当多作业并行执行的时候，这些作业的`EXECUTOR_NUMBER`就有可能是相同的

  - $NODE_NAME

    节点名称

    输出例子：`master`

  - $NODE_LABELS

    节点标识

    输出例子：`master`

  - $WORKSPACE

    作业的工作区目录路径

    输出例子：`/Users/Shared/Jenkins/Home/workspace/jimvin-app`

  - $JENKINS_HOME

    jenkins的Home目录路径

    输出例子：`/Users/Shared/Jenkins/Home`

  - $JENKINS_URL

    jenkins的URL

    输出例子：`http://c4d3fe77.ngrok.io/`

  - $BUILD_URL

    构建的URL

    输出例子：`http://c4d3fe77.ngrok.io/job/jimvin-app/102/`

  - $JOB_URL

    作业的URL

    输出例子：`http://c4d3fe77.ngrok.io/job/jimvin-app/`

## 插件环境变量
- `Git Plugin` 环境变量
  - $GIT_COMMIT
    
    当前提交的散列码

    输出例子：`02159eb63d503d562b83c2326fd4e531a6d75a0d`

    > 提示：如果本地提交多次，然后再push到远程仓库，那么`$GIT_COMMIT`显示最近一次提交的散列码

  - $GIT_BRANCH
    
    远程仓库名称（默认`origin`)，拼接触发构建的提交所在分支的分支名称

    输出例子：`origin/master`

    > 提示：假如我提交到`master`分支，那么`$GIT_BRANCH`的值为`origin/master`，但是必须保证你的提交所在的分支能触发构建，假如我设置多条分支都能触发构建，
      那么`$GIT_BRANCH`能用于反映出究竟是哪条分支触发构建的。
    
    如何设置和查看作业的构建分支？
    
    > 答：在作业的配置页，源码管理->Git->Branches to build区域查看或设置，下图表示master分支的提交会触发构建

    ![][branchsToBuild]
  
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
    # 定位到作业工作区（workspace）
    cd /Users/Shared/Jenkins/Home/workspace/jimvin-app
    git branch
    ```
    
    显示当前分支为`sandbox`

    ![][checkJimvinAppBranch]

  - $GIT_PREVIOUS_COMMIT

    上一次触发构建的提交的散列码

    输出例子：`bf29c6ae90539721a0d8c601ef98300362a04a5d`

  - $GIT_PREVIOUS_SUCCESSFUL_COMMIT

    上一次触发构建并构建成功的提交的散列码

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

  > 提示：$GIT_AUTHOR_NAME，$GIT_COMMITTER_NAME，$GIT_AUTHOR_EMAIL，$GIT_COMMITTER_EMAIL这些变量都来源于配置
    
  - 配置方式一：系统配置页设置

    ![][configGitPlugin]

  - 配置方式二：作业配置页设置

    ![][configGitPlugin2]

    ![][jobUserNameEmail]

  如果两种方式都有设置，则以`配置方式二`的为准

[configGitPlugin]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/config_git_plugin.png    
[configGitPlugin2]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/config_git_plugin_2.png    
[configGitPluginBranch]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/config_git_plugin_branch.png    
[configGitPluginBranch2]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/config_git_plugin_branch2.png   
[jimvinAppSource]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/jimvin_app_source.png   
[checkJimvinAppBranch]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/check_jimvin_app_branch.png   
[branchsToBuild]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/branchs_to_build.png   
[jobUserNameEmail]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/job_username_email.png   