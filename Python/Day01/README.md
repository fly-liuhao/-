## 第一章：Python入门
#### 一、语言：人和人之间沟通的语言。人和计算机之间沟通也需要语言
计算机算机语言：（按照级别分类）
1. 机器语言：高电位-1，低电位-0；打孔-1，不打孔-0；
2. 汇编语言：助记符号 eg:add 2 3 与底层相关
3. 高级语言：越高级的语言越接近人类(C、C++、Java、.net、Python、php)

#### 二、语言的从执行方式
1. 编译执行：源文件，执行的时候，会被编译一次，编译成二进制文件（0110111...）,然后运行
    - 优点：因为只编译一次，所以运行速度快
    - 缺点：可以执行差（将二进制文件直接放到其他操作系统下，不能直接运行
    - 适用场合：底层开发，不做底层修改的时候 (C,C++)

2. 解释执行：少了编译的过程，对于源码文件，会有【解释器】去解析
    - 优点：可移植性好，在不同的操作系统中安装不同的解释器
    - 缺点：每执行一句话，就要编译一次，所以运行速度慢
    - 适用场合：做系统级，Web对外开发 （Python、JavaScript）

Java:既是解释型语言，又是编译型语言
	因为Java有自己的虚拟机（JVM）,编译之后都会有一个字节码文件（.class）生成，它介于高级语言与低级语言之间

#### 三、Python语言介绍

1. 发展史
荷兰人 龟叔 ABC语言的开发者，这门语言非常好，但是失败了，原因是不对外开放（不开源）
1989年，一个圣诞，要写一门语言，避免ABC中犯的错误并升级，开源——Python
Python----飞行的马戏团（python是一条蟒蛇的名字，他很喜欢这部剧，所以就起成了这门语言名字）
Java----(原本名字是Oak-橡树，注册的时候发现有人注册了，几个人在咖啡店里就把名字改为Java了)
Linux----是Linus开发的（对Unix不满，提意见不接受，在网上发布一起写一个系统）
火的过程：人工智能火了，指定了一门语言就是Python(因为人工智能中数据分析、机器学习最强大的软件----facabook出的 torch 工具 ----2017年针对于Python开发了一个版本pytorch，指定了老大就是Python）

2. Python版本（Python硬伤）
2X版：2.7注明不在继续扩展升级
3X版：

3. Python特点
	- 语法简单（c:100行 java:20行 Python:10行)
	- 既能面向过程也能面向对象
	- 解释性语言，可以执行好----跨平台
	- 可扩展性：和其它语言合并使用
	- 强大的库（自己的库、第三方库）

4. Python的应用
	- Web开发
	- 网络爬虫：指定规则，让计算机自己找要用的信息（图片、数据、新闻）---为机器学习提供数据
	- 游戏编程：（工作比较苦--封闭开发）
	- 人工智能（算法）

5. Python缺点
	- 速度慢（语法简单，翻译慢）
	- 不可加密（开源）

#### 四、Python安装
1. Ptthon2和Python3：https://zhidao.baidu.com/question/714185984841099525.html
2. 下载：https://www.python.org/downloads/windows/
3. 安装验证：https://www.jb51.net/article/146307.htm

注：设置环境变量
- 窗口设置
 右键--我的电脑--属性--高级设置--环境变量
 永久性设置
- 使用cmd命令设置
 临时设置（窗口关闭失效）
 set命令



#### 五、Pycharm安装
1. 常用Python IDE介绍:
    - https://www.jianshu.com/p/57d2e515f8bc
    - http://www.runoob.com/w3cnote/best-python-ide-for-developers.html

2. 安装PyCharm
    - 下载：https://www.jetbrains.com/pycharm/download/#section=windows
    - 安装激活教程：https://blog.csdn.net/qq_15698613/article/details/86502371
    - 激活的两种方式：https://blog.csdn.net/u014044812/article/details/78727496

3. 简单使用：
    - https://blog.csdn.net/qq_40130759/article/details/79421242
    - https://blog.csdn.net/qq_33570092/article/details/80145249

#### 六、Python基础
1. Python程序的执行
    - 交互模式执行
        cmd输入python命令敲回车，相当于调用python的解释器，然后等待执行：“>>>”后面输入代码
    - 脚本模式执行
		在磁盘中建立脚本文件（.py），执行通过python命令+脚本文件路径
    - 两种模式区别
    	交互模式：相当于一行一行的输入源代码，每输入一行，就执行一行
        脚本模式：一次性吧.py文件所有的源代码全部执行，没有机会进行交互

2. 变量和常量
	- 变量：
        ``` python
        # 1.使用变量名绑定特定的值，相当于给变量名贴标签
        a = "ABC"
        """
        两件事情：
            (1)在内存中创建ABC的值，存到内存中
            (2)在内存中创建一个a变量
            (3)变量a绑定到ABC值的内存上
        """

        # 2.多个变量指向同一个地址:
        a = "ABC"
        b = "ABC"
        print(id(a),id(b)) # 内存地址相同
        # id()函数:显示对应的内存地址
        # Python本身是基于内存的管理：像数值、字符串、字节同样的值占用相同的内存。

        # 3.修改变量的绑定
        # 第一次赋值，相当于定义变量
        # 第二次再次赋值，相当于变量指向
        # 注：忽视变量值的类型

        # 4.变量名（标识符）定义规则：
        # （1）字母、数字、下划线 组合，但是不能以数字开头
        # （2）变量在使用之前必须赋值，因为第一次赋值才会内存中创建变量名
        # （3）变量没有类型，所以可以使用同一变量绑定不同类型的对象
        # Python是鸭子类型（Duck typing）的语言，所谓鸭子类型，指的是代码关注的不是对象的类型本身，而是它被如何使用的

        # 6.静态语言和动态语言
        # 动态语言：给变量赋值或者定义的时候，不需要考虑变量的类型，变量的类型不固定 (Python、php、JavaScript)
        # 静态语言：给变量赋值或者定义的时候，必须先指明变量的类型(C、C++、Java)

        # 7.强类型语言和弱类型语言
        # 强类型语言：一旦一个变量被执行多了某一个数据类型，如果不经过强制转换，那么它永远就是这个数据类型(Python)
        # 弱类型的语言：一个变量指定了一种数据的类型，使用的时候，可以自动转换类型（php）

        # 8.Python: 强类型、动态语言

        # 9.变量值的交换
        # (1)通过临时变量
            temp = x
            x = y
            y = temp
        # (2)平行赋值
            x,y = y,x
            a,b = 1,2

        # 10.变量的删除
        # 变量销毁时刻：等待Python的垃圾回收、自己删除变量
        # del 变量名
        	a = "ABC"
            del a
            print(a)
        # 注意：删除变量时，删除的是变量的名字，不是变量值，变量值要等待垃圾回收
		```
	- 常量：不能修改的变量
        ``` python
        # 1.普通常量，不是Python的硬性规定
           # 常量：不能修改的变量
           # 常量的定义：大写字母、数字 命名
        # 2.None
           # Python中内置的常量，表示变量值的缺失
            a = None
           # 注：以下含义都是不同的概念
                a = None
                b = "" #空串
                c = 0
                print(type(a), type(b), type(c))#结果：<class 'NoneType'> <class 'str'> <class 'int'>
           # type()可以显示一个对象的类型
        ```

3. 输入输出
	- 输出：
	```python
    # print() 是Python的内置方法
    # print(values,sep,end,file,flush)
    # valuse：可变参数 sep：用什么分割 end:命名关键字参数、默认值参数
    # print()默认是以\n（换行）结尾的
    print("Hello World !",end="")# 想要不以\n结尾
    print("x","y","z",sep="-")# 字符之间通过sep指定字符连接
    ```
    - 输入
    ```python
    # input()阻塞状态函数
    # 括号里放提示信息
    name = input("请输入你的的名字：")
    print("你的名字是",name,sep=":")
    ```

4. 注释
	- 单行注释：#开始到当前行结束，被注释的内容不会被Python解析器解析
	- 特殊注释：(经过Python解释器)
		(1)指定设置Python解释器的位置
        在文件的第一行加入`#!/usr/bin/env python`
        不写（指定）不报错原因是：Python版本比较高，使用Python2或者Linux系统就必须要添加
        (2)设置文件的编码
        文件开头添加`# -*- coding:utf-8 -*-`
        不写不报错原因是：Python3默认编码是utf-8,而Python2默认编码是ASCII

5. 标识符
 - 标识符：变量名、类名、方法名
 - 规则：
 	(1)字母、数字、下划线，不能一数字开头
    (2)一定不能是关键字
    	```python
    	import keyword
		keyword.kwlist
		```
    (3)标识符区分大小写
    	```python
    	a="Hello"
		A="Python"
		```
    (4)一般不用@、$、*这些字符

6. 关键字
	Python中具有特殊意义的符号
``` python
    import keyword
    keyword.kwlist
```
