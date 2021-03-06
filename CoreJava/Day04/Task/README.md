#### 课后任务
- [X] 任务一：不同类型编码：ASCII ,ISO8859-1,GB2312,GBK,Unicode,UTF-8
[参考连接](https://blog.csdn.net/Fly_1213/article/details/85249201)
- **ASCII**：计算机最初是由美国等国家发明的，所以最初的字符编码规范是以英文为基础。录入英文字符编码标准：ASCII(American Stardard Code for Information InterChange 美国信息互换标准代码)，单字节编码，使用单字节8位 前127个存储英文字母及标点符号。

- **ISO8859-1 / Latin-1** ：ISO(国际标准化组织)在ASCII基础上做的扩展，向下兼容ASCII，也是单字节编码，是许多欧洲国家使用的编码标准。

- **GB2312** ：随着发展，各国都需要使用各国的语言使用计算机，相应的，我国大陆地区采用双字节 高低位字节的方式，存储简体中文。当存储中文字符时，高低位都存放大于127的数字，当读取高位字节时，若大于127，则认为是中文字符，将读取双字节进行识别，若小于127，则认为是英文字符，单字节识别。另外，GB2312在大于127位的编码库也提供了中文符号的编码，故英文标点符号称做半角符号，中文标点符号称作全角符号。

- **GBK** ：对GB2312的拓展，双字节编码，区别是当存储中文字符时，高位存放大于127的数字，低位不再是大于127的数字，将127之前的数字也囊括了。GBK将繁体中文也囊括进来。

- **Unicode** ：针对各个国家都使用不同的编码机制，iso(国际标准化组织)又站了出来，对全球编码做了整个的囊括，推出了Unicode ，但其字符集也是最复杂、占用空间最大的。
  Unicode，定长双字节编码，对ASCII采取高位补零的方式拓展，不兼容iso8859-1编码。
  说明： 定长编码便于计算机处理（GB2312/GBK不是定长编码），而unicode又可以用来表示所有字符，所以在很多软件内部是使用unicode编码来处理的，比如java。

- **UTF-8** ：由于Unicode是一组编码映射，即一个字符映射一个16进制数字的形式。随着互联网发展，unicode不便于传输和存储，为了节省资源（无论是硬盘存储还是流量），相应的就产生了utf-8编码。
  UTF-8兼容ISO8859-1编码，同时也可以用来表示所有语言，不过UTF-8编码是不定长编码，一般来讲，英文字母都是用一个字节表示，而汉字使用三个字节，比 unicode编码节省空间。

***
- [X] 任务二：转义字符

|转义字符|意义|ASCII码值（十进制）
| :--:| :--:|:--:|
|\n| 换行(LF) ，将当前位置移到下一行开头|010
|\t| 水平制表(HT) （跳到下一个TAB位置）| 009
|\r| 回车(CR) ，将当前位置移到本行开头| 013
|\ \\| 代表一个反斜线字符'\\' |092
|\\"|代表一个双引号字符|034
|\\?|	代表一个问号|	063
|\0|空字符(NUL)|000
|\a|响铃(BEL)|007
|\b|退格(BS) ，将当前位置移到前一列|008
|\f|换页(FF)，将当前位置移到下页开头|012

***
- [X] 任务三：什么是Java中的垃圾回收机制？
- [参考连接:垃圾回收机制](https://www.cnblogs.com/wabi87547568/p/5282892.html)
- [参考连接:图解Java 垃圾回收机制](https://blog.csdn.net/justloveyou_/article/details/71216049)
1. 垃圾回收机制（有延时）
  1）立即回收器(Garbage Collection ,GC)是JVM自带的一个线程（伴随主程序运行着的程序），用于回收废弃的对象;
  2）Java程序员不用亲自回收废弃对象，因为垃圾回收机制会自动进行回收;

2.  触发GC的条件
  1）GC在优先级最低的线程中运行，一般在应用程序空闲即没有应用线程在运行时被调用(存在延时)。但下面的条件例外。
  2）Java堆内存不足时，GC会被调用。当应用线程在运行，并在运行过程中创建新对象，若这时内存空间不足，JVM就会强制调用GC线程。若GC一次之后仍不能满足内存分配，JVM会再进行两次GC，若仍无法满足要求，则JVM将报“out of memory”---内存泄漏的错误，Java应用将停止。
3. 两个重要方法
  1）System.gc()方法
使用System.gc()可以不管JVM使用的是哪一种垃圾回收的算法，都可以请求Java的垃圾回收。在命令行中有一个参数-verbosegc可以查看Java使用的堆内存的情况，它的格式如下：java -verbosegc classfile    由于这种方法会影响系统性能，不推荐使用，所以不详诉。
  2） finalize()方法
在JVM垃圾回收器收集一个对象之前，一般要求程序调用适当的方法释放资源，但在没有明确释放资源的情况下，Java提供了缺省机制来终止该对象心释放资源，这个方法就是finalize（）。它的原型为：protected void finalize() throws Throwable   在finalize()方法返回之后，对象消失，垃圾收集开始执行。原型中的throws Throwable表示它可以抛出任何类型的异常。

> 之所以要使用finalize()，是存在着垃圾回收器不能处理的特殊情况。例如：
> 1）由于在分配内存的时候可能采用了类似 C语言的做法，而非JAVA的通常new做法。这种情况主要发生在native method中，比如native method调用了C/C++方法malloc()函数系列来分配存储空间，但是除非调用free()函数，否则这些内存空间将不会得到释放，那么这个时候就可能造成内存泄漏。但是由于free()方法是在C/C++中的函数，所以finalize()中可以用本地方法来调用它。以释放这些“特殊”的内存空间。
> 2）又或者打开的文件资源，这些资源不属于垃圾回收器的回收范围。

4. 减少GC开销的措施
  1)不要显式调用System.gc()。此函数建议JVM进行主GC,虽然只是建议而非一定,但很多情况下它会触发主GC,从而增加主GC的频率,也即增加了间歇性停顿的次数。大大的影响系统性能。  
  2)尽量减少临时对象的使用。临时对象在跳出函数调用后,会成为垃圾,少用临时变量就相当于减少了垃圾的产生,从而延长了出现上述第二个触发条件出现的时间,减少了主GC的机会。
  3)对象不用时最好显式置为Null。一般而言,为Null的对象都会被作为垃圾处理,所以将不用的对象显式地设为Null,有利于GC收集器判定垃圾,从而提高了GC的效率。
  4)尽量使用StringBuffer,而不用String来累加字符串。由于String是固定长的字符串对象,累加String对象时,并非在一个String对象中扩增,而是重新创建新的String对象,如Str5=Str1+Str2+Str3+Str4,这条语句执行过程中会产生多个垃圾对象,因为对次作“+”操作时都必须创建新的String对象,但这些过渡对象对系统来说是没有实际意义的,只会增加更多的垃圾。避免这种情况可以改用StringBuffer来累加字符串,因StringBuffer是可变长的,它在原有基础上进行扩增,不会产生中间对象。  
  5)能用基本类型如Int,Long,就不用Integer,Long对象。基本类型变量占用的内存资源比相应对象占用的少得多,如果没有必要,最好使用基本变量。
  6)尽量少用静态对象变量。静态变量属于全局变量,不会被GC回收,它们会一直占用内存。
  7)分散对象创建或删除的时间。集中在短时间内大量创建新对象,特别是大对象,会导致突然需要大量内存,JVM在面临这种情况时,只能进行主GC,以回收内存或整合内存碎片,从而增加主GC的频率。集中删除对象,道理也是一样的。它使得突然出现了大量的垃圾对象,空闲空间必然减少,从而大大增加了下一次创建新对象时强制主GC的机会。

5. Java程序的内存泄漏问题（不可避免）
1）内存泄漏是指废弃的对象没有被及时的回收;
2）严重的内存泄漏会导致内存中的废弃对象越来越多，直到内存占满程序崩溃;
3）垃圾回收机制判断对象何时回收的依据是该对象是否还有变量在引用;
4）建议：确定一个引用变量的对象不在使用时，应该及时将引用类型变量设置为null;

***
- [X] 任务四：java finalize方法总结、GC执行finalize的过程
- [参考：java finalize方法总结、GC执行finalize的过程](https://www.cnblogs.com/Smina/p/7189427.html)
1. finalize()方法定义在Object类中，所以所有类都继承了finalize()
2. 当应用程序或 Applet 退出时，调用每个对象的finalize() 方法
3. 调用时间：垃圾回收器在确定某对象没有被引用时(删除之前)，就对此对象调用方法
4. 主要用途：回收特殊渠道申请的内存，如非Java程序(C/C++)申请的内存
5. 不建议使用finalize(),如果用：尽量简单，且要避免对象再生
