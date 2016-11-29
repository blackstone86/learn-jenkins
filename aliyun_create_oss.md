# 阿里云OSS开通和使用

## 步骤
- 开通OSS

  - [选择OSS资源包规格](https://common-buy.aliyun.com/?commodityCode=ossbag#/buy?request=%7B%22region%22:%22cn-shanghai%22,%20%22ossbag_type%22:%22storage%22,%20%22ossbag_spec%22:%221024%22,%20%22ord_time%22:%226:Month%22%7D)
    
    ![][ossPrice]

    > 我的存储包规格100GB，地域是`华南1`，深圳存储包，开通1年，整个套餐原价156元，如果是新[注册](https://account.aliyun.com/register/register.htm?spm=5176.doc32190.419246.1.AtoOqI)用户可以领一个新手礼包，加上开通一年有7.5折优惠，最后只需要9元，优惠147元。如果没有新手礼包，这个套餐要117元。
      所以如果没有新手礼包，就选40GB，半年期5元，一年期9元，拿来搞一下学习还是值得的

    ![][myOssPrice]

- [登陆](https://home.console.aliyun.com/?spm=5176.7933691.416540.20.mSbanm)阿里云控制台

  > 没有账号的先注册

- 登陆后，点击`新建Bucket`按钮
  
  ![][createBucket]

  填写`Bucket`配置

  ![][newOssBucket]

  > `所属地域`应该选择你的存储包所属的地域，`读写权限`选择`公共读写`，是为了我自己方便做试验，在实际应用中应避免使用以保障数据安全

  成功后，点击`jimvin-bucket`进入`bucket`详情页
  
  ![][checkBucket]

  选择左侧`Object管理`菜单项

  ![][objectManage]

  点击`上传文件`按钮尝试上传文件到OSS

  ![][uploadFile]
  
- 常用的OSS工具
  
  - `OSS控制台客户端(驻云)`(官方推荐第三方工具)
    - 下载客户端并安装
      - 方法一：在控制台直接[下载安装包](http://gosspublic.alicdn.com/ossclient_v1.1.6-mac.zip?spm=5176.2020520105.113.3.r00g24&file=ossclient_v1.1.6-mac.zip)
    
        ![][downloadOssTool]

      - 方法二：到`云市场`[下载页](https://help.aliyun.com/document_detail/32204.html?spm=5176.doc44075.2.1.sBur1r)，选择适合版本下载
    
        ![][downloadOssTool2]

    - 回到阿里云控制台，点击`AccessKeys`按钮获取`访问阿里云API的秘匙`

      ![][getSecret]
     
    - 对客户端授权

      ![][ossClientConfig]

      输入刚才获取的`Access Key ID`和`Access Key Secret`，点击`登陆`按钮
      
      ![][accessOssClientTool]

      输入安全密码，用于下次登陆客户端时检验

      ![][setOssClientPwd]

      成功后，进入客户端使用界面

      ![][sccessLoginOssClent]

  - `ossftp`（官方工具）
    - 到`云市场`[下载页](https://help.aliyun.com/document_detail/32190.html?spm=5176.doc44075.2.8.N9vrTf)，选择适合版本下载
    
      ![][downLoadOssftp]

    - 启动`ossftp`（即运行一个FTP server）
      
      打开终端，定位到工具解压目录

      ```shell
      cd /Users/jimvin/Downloads/ossftp-1.0.2-linux-mac
      ```
      
      继续输入以下代码

      ```shell
      bash start.command
      ```

      成功启动后，如下所示

      ![][succesStartOssftp]

      浏览器自动打开ossftp配置页，如下所示

      ![][succesStartOssftp2]

    - [下载](https://filezilla-project.org/?spm=5176.doc32190.2.3.1kC2PZ)FileZilla客户端，用于连接到刚才启动的`FTP server`
      
      选择适合版本下载

      ![][downloadFilezilla]

      安装并打开FileZilla客户端，输入登陆信息，点击`快速连接`按钮

      ![][loginOssftpByFilezilla]

      |主机|用户名|密码|端口|
      |---|:---|:---:|---:|
      |127.0.0.1|Access Key ID/bucket_name（eg：LTAIsL2jO98Pr7B0/jimvin-bucket）|Access Key Secret|2048|

      登陆成功，如下所示

      ![][successLoginOssftpByFilezilla]

## 总结
   到此为止，我们简单介绍了如何开通阿里云OSS对象存储服务，并讲解了两个常用配套工具
   - `OSS控制台客户端(驻云)`：与阿里云控制台中的OSS操作相比，会更加灵活方便
   - `ossftp`：让我们可以用FTP的方式来使用OSS，当启动了`ossftp`后，就能用`FileZilla客户端`操作OSS
      ，也可以在jenkins中安装相关FTP插件实现将构建后的项目目录自动上传到OSS

## 阿里云OSS官方资源
  - [对象存储OSS](https://www.aliyun.com/product/oss/?spm=5176.8142029.418687.8.6BcYhs)
  - [OSS常用工具汇总](https://help.aliyun.com/document_detail/44075.html?spm=5176.product31815.3.1.3ZGONV)
  - [ossftp项目主页（GitHub）](https://github.com/aliyun/oss-ftp)
  - [ossftp官网主页](https://help.aliyun.com/document_detail/32190.html)

[ossPrice]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/oss_price.png
[myOssPrice]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/my_oss_price.png     
[createBucket]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/create-bucket.png     
[newOssBucket]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/new-oss-bucket.png     
[checkBucket]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/check-bucket.png     
[objectManage]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/object_manage.png
[uploadFile]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/upload_file.png
[downloadOssTool]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/download_oss_tool.png
[downloadOssTool2]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/download_oss_tool_2.png
[ossClientConfig]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/ossclient_config.png
[getSecret]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/get_secret.png
[accessOssClientTool]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/access_oss_client_tool.png
[setOssClientPwd]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/set_oss_client_pwd.png
[sccessLoginOssClent]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/sccess_login_oss_clent.png
[downLoadOssftp]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/down_load_ossftp.png
[succesStartOssftp]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/succes_start_ossftp.png
[succesStartOssftp2]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/succes_start_ossftp2.png
[downloadFilezilla]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/download_filezilla.png
[loginOssftpByFilezilla]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/login_ossftp_by_filezilla.png
[successLoginOssftpByFilezilla]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/success_login_ossftp_by_filezilla.png
