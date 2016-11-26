# 9元开通阿里云OSS

## 步骤
- 开通[OSS](https://www.aliyun.com/product/oss/?spm=5176.8142029.418687.8.6BcYhs)

  - 选择OSS资源包规格(https://common-buy.aliyun.com/?commodityCode=ossbag#/buy?request=%7B%22region%22:%22cn-shanghai%22,%20%22ossbag_type%22:%22storage%22,%20%22ossbag_spec%22:%221024%22,%20%22ord_time%22:%226:Month%22%7D)
    
    ![][ossPrice]

    > 我的存储包规格100GB，地域是`华南1`，深圳存储包，开通1年，整个套餐原价156元，由于今年双十一领了一个新手礼包，加上开通一年有7.5折优惠，最后只需要9元，优惠147元。如果没有新手礼包，这个套餐要117元。
      所以如果没有新手礼包，就选40GB，半年期5元，一年期9元，拿来搞一下学习还是值得的

    ![][myOssPrice]

- 登陆[阿里云控制台](https://home.console.aliyun.com/?spm=5176.7933691.416540.20.mSbanm)

  > 没有账号就先注册一个账号

- 登陆后，点击`新建Bucket`按钮，新建一个`Bucket`
  
  ![][createBucket]

  填写`Bucket`配置

  ![][newOssBucket]

  > `所属地域`应该选择你的存储包所属的地域，`读写权限`选择`公共读写`，是为了前期方便做试验，在实际应用中应避免使用以保障数据安全

  成功后，点击`jimvin-bucket`进入`bucket`详情页
  
  ![][checkBucket]

  选择左侧`Object管理`菜单

  ![][objectManage]

  点击`上传文件`按钮尝试上传文件到OSS
  
- 常用的OSS工具
  
  - `OSS控制台客户端(驻云)`
    - 下载客户端
      - 方法一：在控制台直接[下载安装包](http://gosspublic.alicdn.com/ossclient_v1.1.6-mac.zip?spm=5176.2020520105.113.3.r00g24&file=ossclient_v1.1.6-mac.zip)
    
      ![][downloadOssTool]

      - 方法二：到`云市场`[下载页](https://help.aliyun.com/document_detail/32204.html?spm=5176.doc44075.2.1.sBur1r)，选择适合版本下载
    
      ![][downloadOssTool2]

    - 授权客户端
      
      ![][ossClientConfig]

- 资源链接
  - [对象存储OSS](https://www.aliyun.com/product/oss/?spm=5176.8142029.418687.8.6BcYhs)
  - [OSS常用工具汇总](https://help.aliyun.com/document_detail/44075.html?spm=5176.product31815.3.1.3ZGONV)

[ossPrice]: https://jenkins.io/sites/default/files/oss_price.png
[myOssPrice]: https://jenkins.io/sites/default/files/my_oss_price.png     
[createBucket]: https://jenkins.io/sites/default/files/create-bucket.png     
[newOssBucket]: https://jenkins.io/sites/default/files/new-oss-bucket.png     
[checkBucket]: https://jenkins.io/sites/default/files/check-bucket.png     
[objectManage]: https://jenkins.io/sites/default/files/object_manage.png
[uploadFile]: https://jenkins.io/sites/default/files/upload_file.png
[downloadOssTool]: https://jenkins.io/sites/default/files/download_oss_tool.png
[downloadOssTool2]: https://jenkins.io/sites/default/files/download_oss_tool_2.png
[ossClientConfig]: https://jenkins.io/sites/default/files/ossclient_config.png