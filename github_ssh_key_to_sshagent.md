# 添加SSH钥匙到`ssh-agent`

## 步骤
- 打开终端
- 确认`ssh-agent`是否可用

  ```shell
    eval "$(ssh-agent -s)"
  ```

  > 提示：如果可用会返回`Agent pid 20194`（其中**20194**会被替换成你的pid)

- 添加ssh私匙到`ssh-agent`
  
  命令行中**id_rsa**为ssh私匙文件名，请用你自己的ssh私匙替代

  ```shell
    ssh-add ~/.ssh/id_rsa
  ```

- [添加SSH钥匙到GitHub账户](https://github.com/blackstone86/learn-jenkins/blob/master/github_ssh_key_add.md)
 

[CheckSshKeyImage]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/check_ssh_key.png