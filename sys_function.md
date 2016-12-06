# 系统内置方法

- cp
  
  复制当前目录下的`bundles.tgz`文件到当前目录下的`assets`文件夹

  ```shell
  # 等价于 cp "bundles.tgz" assets
  cp "bundles.tgz" ./assets
  ```

- cd
  
  定位到当前目录下的`.temp`文件夹

  ```shell
  cd .temp
  ```

- tar

  将当前目录下的所有文件打包成一个压缩文件`bundles.tgz`

  ```shell
  tar -zcf "bundles.tgz" *
  ```

- ls

  显示当前目录下所有文件的详细信息

  ```shell
  ls -la
  ```

- mv
  
  将当前目录下的`bundles.tgz`文件迁移到当前目录的`assets`文件夹下

  ```shell
  # 等价于 mv "bundles.tgz" assets
  mv "bundles.tgz" ./assets
  ```

- rm
  
  强制将当前目录下的`node_modules`文件夹删除

  ```shell
  rm -rf ./node_modules
  ```  

  强制将当前目录下的`.dist`文件夹下的所有文件删除

  ```shell
  rm -rf ./.dist/*
  ```

