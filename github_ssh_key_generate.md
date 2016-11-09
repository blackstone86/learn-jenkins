# 生成一个新的SSH钥匙

## 步骤
- 打开终端
- 获取GitHub邮箱地址

   ```shell
   git config --global user.email
   ```

   如果没有，就设置一个
   
   ```shell
   git config --global user.email "jimvin@qq.com"
   ```
- 输入以下命令，并用你的GitHub邮箱地址代替
   ```shell
    ssh-keygen -t rsa -b 4096 -C "your_email@example.com"
   ```
   ![][GenerateSshKeyImage]
- 当提示`Enter file in which to save the key`，点击回车，将钥匙保存在默认路径
   ![][SaveSshKeyImage]
- 按提示输入密码
   ![][EnterSshKeyPassphrase]

[GenerateSshKeyImage]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/generate_ssh_key.png
[SaveSshKeyImage]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/save_ssh_key.png
[EnterSshKeyPassphrase]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/enter_ssh_key_pwd.png
  

