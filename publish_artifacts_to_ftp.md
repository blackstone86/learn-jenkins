# 构建后操作之发布到OSS

## 步骤
- 安装插件

- 在jenkins系统配置页，设置`FTP repository hosts`，并保存

  ![][selectPublishArtifactsToFtp]

  |Profile Name|hostname|Port|TimeOut|Root Repository Path|User Name|Password|
  |:---|:---|:---|:---|:---|:---|:---|
  |Jimvin-OSS-FTP|localhost|2048|3000|/learnJenkins|Access Key ID/bucket_name（eg：LTAIsL2jO98Pr7B0/jimvin-bucket）|Access Key Secret|
   
- 在作业配置页面，`构建后操作`中选择`Publish artifacts to FTP`项目

  ![][selectPublishArtifactsToFtp]

- 设置作业的`Publish artifacts to FTP`
  
  新增上传文件目录配置，点击`新增`按钮

  ![][addUploadConfig]
  
  设置`Source`（仓库目录）和`Destination`（上传到OSS的指定目录），勾选`Use timestamps`，并保存

  ![][setFileUpload]

  > `assets/*.png`表示仓库中assets文件夹下的所有png图片，构建后会将这些图片自动上传到`pkgs/development/latest`，如果勾选了`Use timestamps`
    ，则在指定上传目录下再新建一个以时间戳命名的文件夹，并将图片上传到该文件夹上，类似`pkgs/development/latest/2016-11-29_16-19-04`

- 验证是否设置成功
  
  - 在仓库push代码变更

  - 查看构建日志

    

    

[selectPublishArtifactsToFtp]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/select_publish_artifacts_to_ftp.png
[configFtpRepositoryHosts]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/config_ftp_repository_hosts.png
[addUploadConfig]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/add_upload_config.png
[setFileUpload]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/set_file_upload.png