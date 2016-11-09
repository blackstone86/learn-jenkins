# 检查已有的SSH钥匙

## 步骤
- 打开终端
- 输入`ls -al ~/.ssh` 检查是否存在**ssh钥匙**
  ![][CheckSshKeyImage]
- 通过目录列表检查是否已经存在ssh钥匙
  - ssh钥匙的文件名通常为以下其中一种
    - id_dsa.pub
    - id_ecdsa.pub
    - id_ed25519.pub
    - id_rsa (私匙)
- 如果你没发现有公匙和私匙，或者你不想用已有的作为连接GitHub的身份验证，那么初始化一个**新**的
- 如果你发现已有一个公匙或私匙(比如id_rsa.pub、id_rsa)并想用来作为连接GitHub的身份验证，你可以将ssh钥匙添加到`ssh-agent`

[CheckSshKeyImage]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/check_ssh_key.png