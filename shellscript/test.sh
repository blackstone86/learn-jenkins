#!/bin/sh

############################################################
#  文件测试运算符 (共13个)
#  -d 判断目录是否存在
#  -e 判断文件或目录是否存在
#  -r 判断文件是否可读
#  -w 判断文件是否可写
#  -s 判断文件是否为空（文件大小为0字节，认为是空文件）
#  -f 判断是否为文件
#  -u 判断可执行文件是否设置为suid访问模式
#  -g 判断可执行文件是否设置为sgid访问模式
#  -k 判断是否设置了Sticky Bit
#  -x 判断是否可执行
#  -b 判断是否为模块特殊设备
#  -c 判断是否为字符特殊设备
#  -p 判断是否具名管道
############################################################
directory=/Users/jimvin/
file=/Users/jimvin/test.sh
blockdevice=/dev/disk1
characterdevice=/dev/cu.Bluetooth-Incoming-Port
pipefile=/Users/jimvin/pipefile

# 判断目录是否存在
# 如果是文件，即使该文件存在，也会返回false
if [ -d $directory ]; then
    echo "$directory 目录存在"
else
    echo "$directory 目录不存在"
fi

# 判断文件或目录是否存在
if [ -e $file ]; then
    echo "$file 文件或目录存在"
else
    echo "$file 文件或目录不存在"
fi

# 判断文件是否可读
if [ -r $file ]; then
    echo "$file 可读"
else
    echo "$file 不可读"    
fi

# 判断文件是否可写
if [ -w $file ]; then
    echo "$file 可写"
else
    echo "$file 不可写"    
fi

# 判断文件是否为空
if [ -s $file ]; then
    echo "$file 为非空文件"
else
    echo "$file 为空文件"    
fi

# 判断是否为文件
# 对象类型非“-” false
# 存在或不存在的目录 false
# 不存在的文件 false
# 存在的文件 true
# 参考链接：http://www.ibm.com/developerworks/cn/linux/l-lpic1-v3-104-5/
if [ -f $file ]; then
    echo "$file 为普通文件"
else
    echo "$file 为非普通文件"    
fi

# 判断可执行文件是否设置为suid访问模式
# 设置可执行文件设置为suid访问模式 chmod u+s filename 逆操作 chmod u-s filename
# 当文件保存了变更后，之前设置的suid模式会被移除
# 参考链接：http://www.cnblogs.com/fhefh/archive/2011/09/20/2182155.html
if [ -u $file ]; then
    echo "$file 设置为suid访问模式"
else
    echo "$file 没有设置为suid访问模式"    
fi

# 判断可执行文件是否设置为sgid访问模式
# 设置可执行文件设置为sgid访问模式 chmod g+s filename 逆操作 chmod g-s filename 
# 参考链接：http://www.cnblogs.com/fhefh/archive/2011/09/20/2182155.html
if [ -g $file ]; then
    echo "$file 设置为sgid访问模式"
else
    echo "$file 没有设置为sgid访问模式"     
fi

# 判断是否设置了Sticky Bit
# 增加黏贴位，chmod +t ./test.sh 逆操作 chmod -t ./test.sh 
# 设置后的权限为 -rw-r--r-T
# 参考链接：http://www.ibm.com/developerworks/cn/linux/l-lpic1-v3-104-5/  
if [ -k $file ]; then
    echo "$file 设置了Sticky Bit"
else
    echo "$file 没有设置Sticky Bit"     
fi

# 判断是否可执行
# 设置文件可执行 chmod +x filename 逆操作 chmod -x filename 
if [ -x $file ]; then
    echo "$file 为可执行文件"
else
    echo "$file 为非可执行文件"     
fi

# 判断是否为模块特殊设备
# 显示模块设备命令 df 或 diskutil list
# 本机模块设备: /dev/disk1; devfs; map -hosts; map auto_home，但容量大于0才认为是模块设备
if [ -b $blockdevice ]; then
    echo "$blockdevice 为模块特殊设备"
else
    echo "$blockdevice 为非模块特殊设备"     
fi

# 判断是否为字符特殊设备 打印机(printers)、终端(terminals)、调制解调器（modems)
# 查找字符设备方法
# 参考 http://www.infoq.com/cn/articles/linux-kernel-module-part02
# cd /dev
# ls -l ("crw-rw-rw-" c开头表示字符设备, "brw-r-----" b开头表示模块设备, "drwxr-xr-x" d开头表示目录)
if [ -c $characterdevice ]; then
    echo "$characterdevice 为字符特殊设备"
else
    echo "$characterdevice 为非字符特殊设备"     
fi

# 判断是否管道文件
# 参考 https://books.google.com.hk/books?id=o9K8KEQic5sC&pg=PA101&lpg=PA101&dq=character+devices+in+mac&source=bl&ots=lXUU35a6lF&sig=TPs_gKSqnTzdM-F4XaF_qlywlyE&hl=zh-CN&sa=X&ved=0ahUKEwjF4LH31pHRAhUCpZQKHfS3CdEQ6AEIQzAF#v=onepage&q=character%20devices%20in%20mac&f=false
# mkfifo pipefile 当前目录创建管道文件
# ls -l ("prw-r--r--" p开头表示管道文件)
if [ -p $pipefile ]; then
    echo "$pipefile 为管道文件"
else
    echo "$pipefile 为非管道文件"    
fi

############################################################
#  字符串运算符 (共5个)
#  =   判断是否相等
#  !=  判断是否不相等
#  -n  判断字符串是否非空
#  str 判断字符串是否非空
#  -z  判断字符串是否为空
############################################################

# 判断是否相等
# 空字符串变量=没声明的变量 true
# 没声明的变量=没声明的变量 true
# " a"="a "             true
# a="a "                true
if [ $var = $abc ]; then
	echo "\$var 与 \$abc 相等"
else
    echo "\$var 与 \$abc 不相等"
fi

# 判断是否不相等
# 空字符串变量!=没声明的变量 true
# 没声明的变量!=没声明的变量 true
# " a"!="a "             false
# a!="a "                false
if [ $var != $abc ]; then
	echo "\$var 与 \$abc 不相等"
else
    echo "\$var 与 \$abc 相等"
fi 
   
# 判断字符串是否非空，非空字符串 true ，空字符串 false
# 不能写成 if [ -n $var ]; then ，当字符串为空时，错误认为是非空字符串
if [ -n "$var" ]; then
	echo "字符串"
else
    echo "空字符串"
fi

# 判断字符串是否非空，非空字符串 true ，空字符串 false
# 等价于 if [ "$var" ]; then
if [ $var ]; then
	echo "字符串"
else
    echo "空字符串"
fi

# 判断字符串是否为空，空字符串 true ，非空字符串 false
# 等价于 if [ -z "$var" ]; then
if [ -z $var ]; then
	echo "空字符串"
else
    echo "字符串"
fi

############################################################
#  布尔运算符 (共3个)
#  !   非运算
#  -o  或运算
#  -a  与运算
############################################################
one=1
zero=0

# 非运算
if [ ! $one -gt $zero ]; then
	echo "!true return : true"
else
    echo "!true return : false"
fi

# 或运算
if [ $one -gt $zero -o $one -lt $zero ]; then
	echo "true or false return : true"
else
    echo "true or false return : false"
fi

# 与运算
if [ $one -gt $zero -a $one -lt $zero ]; then
	echo "true and false return : true"
else
    echo "true and false return : false"
fi

############################################################
#  关系运算符列表 (共6个)
#  -eq	是否等于
#  -ne	是否不等于
#  -gt	是否大于
#  -lt	是否小于
#  -ge	是否大于等于
#  -le	是否小于等于
############################################################

# 是否等于
if [ $one -eq $zero ]; then
	echo "1是否等于0 : true"
else
    echo "1是否等于0 : false"
fi

# 是否不等于
if [ $one -ne $zero ]; then
	echo "1是否不等于0 : true"
else
    echo "1是否不等于0 : false"
fi

# 是否大于
if [ $one -gt $zero ]; then
	echo "1是否大于0 : true"
else
    echo "1是否大于0 : false"
fi

# 是否小于
if [ $one -lt $zero ]; then
	echo "1是否小于0 : true"
else
    echo "1是否小于0 : false"
fi

# 是否大于等于
if [ $one -ge $zero ]; then
	echo "1是否大于等于0 : true"
else
    echo "1是否大于等于0 : false"
fi

# 是否小于等于
if [ $one -le $zero ]; then
	echo "1是否小于等于0 : true"
else
    echo "1是否小于等于0 : false"
fi

############################################################
#  算术运算符列表 (共8个)
#  +	加法
#  -	减法
#  *	乘法
#  /	除法
#  %	取余
#  =	赋值
#  ==	相等
#  !=	不相等
############################################################

# 加法
echo `expr 1 + 2`; # 3

# 减法
echo `expr 1 - 2`; # -1

# 乘法
echo `expr 1 \* 2`; # 2

# 除法 向下取整
echo `expr 1 / 2`; # 0
echo `expr 2 / 3`; # 0
echo `expr 3 / 2`; # 1
echo `expr 4 / 2`; # 2

# 取余
echo `expr 1 % 2`; # 1

# 赋值
params=1.9
echo $params; # 1.9

# 是否等于
if [ 1 == 2 ]; then
    echo '1等于2: true'
else 
    echo '1等于2: false'
fi

# 是否不等于
if [ 1 != 2 ]; then
    echo '1不等于2: true'
else 
    echo '1不等于2: false'
fi

############################################################
#  技巧类
#  验证变量是否没有定义
#  验证变量是否已经定义
#  等价true的表达式
#  等价false的表达式
#  字符串是否相等判定与双引号无关，但变量不能用单引号
############################################################

# 验证变量是否没有定义
if [ x$VARIABLE = x ] ; then
    echo "\$VARIABLE 没有定义"
else
    echo "\$VARIABLE 已经定义"
fi

# 验证变量是否已经定义
if [ $VARIABLE ] ; then
    echo "\$VARIABLE 已经定义"
else
    echo "\$VARIABLE 没有定义"
fi

# 等价true的表达式
# if [ true ]; then         # 按字符串"true"处理
# if [ false ]; then        # 按字符串"false"处理
# if [ abc ]; then          # 按字符串"abc"处理
# if [ abc = abc ]; then    # 按两个字符串比较处理
# if [ $abc = $abc ]; then  # 按两个没有定义的变量比较处理
# if true; then             # 按布尔值处理
if true; then
    echo "true is true"
else
    echo "true is false."
fi

# 等价false的表达式
# if [ ]; then             # 按没有定义变量处理 falsy值
# if [ $a ]; then          # 按没有定义变量处理 falsy值
# if false; then           # 按布尔值处理 falsy值
# if [ a = a1 ]; then      # 按两个字符串比较处理
if false; then
    echo "false is true"
else 
    echo "false is false"
fi

# 字符串是否相等判定与双引号无关，但变量不能用单引号，如 if [ '$FIRST_ARGUMENT' = Silly ] ; then
# 等价写法：
# if [ "$FIRST_ARGUMENT" = "Silly" ] ; then
# if [ "$FIRST_ARGUMENT" = Silly ] ; then
# if [ $FIRST_ARGUMENT = "Silly" ] ; then
# if [ $FIRST_ARGUMENT = Silly ] ; then
FIRST_ARGUMENT="Silly"
if [ $FIRST_ARGUMENT = 'Silly' ] ; then
    echo "$FIRST_ARGUMENT 等于 Silly"
else
    echo "$FIRST_ARGUMENT 不等于 Silly"
fi



