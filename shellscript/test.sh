#!/bin/sh

# 等价写法
# if [ true ]; then
# if [ false ]; then
# if [ abc ]; then
# if [ abc = abc ]; then
# if [ $abc = $abc ]; then
# if true; then
if true; then
    ls
else
    echo "true is false."
fi

# 等价写法
# if false; then
# if [ ]; then
# if [ $a ]; then
# if [ $a = $a1 ]; then
# if [ a = a1 ]; then
if false; then
    echo "false"
fi

FIRST_ARGUMENT="Silly"
# 等价写法：
# if [ "$FIRST_ARGUMENT" = "Silly" ] ; then
# if [ $FIRST_ARGUMENT = "Silly" ] ; then
# if [ $FIRST_ARGUMENT = Silly ] ; then
if [ "$FIRST_ARGUMENT" = "Silly" ] ; then
    echo "Silly human, scripts are for kiddies."
else
    echo "Hello, world $FIRST_ARGUMENT!"
fi

# 验证没定义的变量
if [ x$VARIABLE = x ] ; then
    echo "Empty variable \$VARIABLE"
fi

############################################################
#  文件测试运算符
#  -d 判断目录是否存在
#  -e 判断文件或目录是否存在
#  -r 判断文件是否可读
#  -w 判断文件是否可写
#  -s 判断文件是否为空（文件大小为0字节，认为是空文件）
#  -f 判断是否为文件
#  -u 判断可执行文件是否设置为suid访问模式
#  -g 判断可执行文件是否设置为sgid访问模式
#  -k 判断是否设置了Sticky Bit
# todo: -c -b -p -x
############################################################
directory=/Users/jimvin/
file=/Users/jimvin/test.sh

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

# 判断文件是否可执行
if [ -x $file ]; then
    echo "$file 可执行"
else
    echo "$file 不可执行"    
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

############################################################
#  字符串运算符
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

