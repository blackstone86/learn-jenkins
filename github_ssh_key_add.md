# 添加SSH钥匙到GitHub账户

## 步骤
- 打开终端
- 执行下面代码，复制ssh钥匙

  > 如果你的钥匙文件名与示例代码不一致，请替换成你的钥匙文件名

  ```shell
  pbcopy < ~/.ssh/id_rsa.pub
  ```

  > 提示：如果`pbcopy`不起作用，你可以去`.ssh`文件夹，用文本编辑器打开钥匙文件，并复制其内容，注意复制的时候不要加入任何新行或者空格
  ，如果你忘记钥匙文件名，可以通过下面代码列出所有钥匙文件

  ```shell
  ls -al ~/.ssh
  ```

- 在页面右上角点击你的头像，然后选择`Settings`

  ![][SettingImage]

- 在左侧`Personal settings`菜单栏点击`SSH and GPG keys`

  ![][ClickSshAndGPGKeyImage]

- 点击`New SSH key`按钮 或 `Add SSH key`按钮
  
  ![][ClickNewSshKeyImage]

- 在“Title”输入框, 添加新钥匙的描述。比如，如果你正在使用公司提供的电脑，你可以输入“公司电脑”

- 在“Key”输入框，输入新钥匙的内容
  
  ![][SshKeyPasteImage]

- 点击`Add SSH key`按钮

  ![][ClickAddSshKeyImage]

- 按提示输入GitHub密码
  
  ![][ConfirmPwdImage]

- 成功添加ssh钥匙
  
  ![][SuccessAddSshKeyImage]
  

[SettingImage]: https://help.github.com/assets/images/help/settings/userbar-account-settings.png
[ClickSshAndGPGKeyImage]: https://help.github.com/assets/images/help/settings/settings-sidebar-ssh-keys.png
[ClickNewSshKeyImage]: https://help.github.com/assets/images/help/settings/ssh-add-ssh-key.png
[SshKeyPasteImage]: https://help.github.com/assets/images/help/settings/ssh-key-paste.png
[ClickAddSshKeyImage]: https://help.github.com/assets/images/help/settings/ssh-add-key.png
[ConfirmPwdImage]: https://help.github.com/assets/images/help/settings/sudo_mode_popup.png
[SuccessAddSshKeyImage]: https://raw.githubusercontent.com/blackstone86/learn-jenkins/master/assets/success_add_ssh_key.png
