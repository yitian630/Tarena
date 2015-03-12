/************   一 搭建Lua环境  ***********************/
下载地址  www.lua.org
download  下载
下载源码解压后进入Lua目录中
1.输入make macosx install 命令进行安装，如果有 make: *** [install] Error 1 错误使用第二中方式
2.输入make macosx 回车  
     make test 回车
     正常会看见  	src/lua -v
				Lua 5.2.3  Copyright (C) 1994-2013 Lua.org, PUC-Rio
	 sudo make install  输入Password 为本机密码  回车
注：如果有 make[2]: Nothing to be done for `all'. 错误， 输入 make clean 回车再重新安装。
安装完
1.输入 lua -v 检测一下
2.输入 lua 回车，进入lua。 然后输入
	print "hello lua" 回车， 查看是否成功打印


/************   二 开发工具安装插件  ***********************/
Sublime Text 2    免费工具
如果要开发 lua 选择 Tools - Build System - New Build System 重新开启一个文件， 在文件中输入
{
	"cmd": ["/usr/local/bin/lua","$file"],
	"file_regex": "^(...*?):([0-9]*):?([0-9]*)",
	"selector": "source.lua"
}
输入完保存，起个名字 LuaBuilder。 关闭就可以了

重新打开 Sublime Text 2 工具，创建文件并保存为 a.lua， 输入
print ("Hello Lua") 
保存  command + B 运行
注意: a.lua所在路径不能出现中文，只能是英文的路径

Package Control 插件的安装
（1）访问Package Control站点按照提示复制一段python命令安装Package Control也可以直接复制这一段到控制台，注：复制Sublime Text 2的内容

import urllib2,os,hashlib; h = '7183a2d3e96f11eeadd761d777e62404' + 'e330c659d4bb41d3bdf022e94cab3cd0'; pf = 'Package Control.sublime-package'; ipp = sublime.installed_packages_path(); os.makedirs( ipp ) if not os.path.exists(ipp) else None; urllib2.install_opener( urllib2.build_opener( urllib2.ProxyHandler()) ); by = urllib2.urlopen( 'http://sublime.wbond.net/' + pf.replace(' ', '%20')).read(); dh = hashlib.sha256(by).hexdigest(); open( os.path.join( ipp, pf), 'wb' ).write(by) if dh == h else None; print('Error validating download (got %s instead of %s), please try manual install' % (dh, h) if dh != h else 'Please restart Sublime Text to finish installation')

调出控制台：View - Show Console  或者 control + ` 
在控制台输入上面的内容， 然后重启Sublime Text 2

调出 Sublime Text 2 - Preference - Package Control 或者 command + shift + p
我们需要 Package Control 帮我们下载一些需要的插件
输入 install package 找所有插件包的源
再输入 lua 可以看到
	Lua Dev
	Lua Love
	SublimeLinter-lua
	GMod Lua
我们安装 Lua Dev 和 SublimeLinter-lua， Lua Love是另外一个2D游戏引擎用的，GMod Lua也是我们不需要
插件会提供一些快捷键 和 代码提示

安装完 我们在 继续搜 cocos2d 把 cocos2d lua 的插件安装上


/********* 三 Lua的HelloWorld ***********/
Lua 是一个脚本语言，不是编译型语言
编译型语言要修改必须要先编译。编译后再做动态连接才能执行，每次修改都需要重现编译，重新连接，重新执行。
Lua是动态编译(动态执行)每次修改不需要重新对文件编译，再连接，每次执行就是连带编辑加运行整个的流程，在运行时编译。 
好处在于：使用Lua语言做为开发语言，
1.Lua做为主开发语言，所有UI和逻辑，全部用Lua去写。
2.Lua如果和别的语言共同开发游戏，
	1）.Lua为主语言，其他语言辅助，可以每次更新Lua
	2）.Lua做为辅助语言，还是要更新客户端
Lua的历史：
巴西团队开发的，设计最初是为了给C 和 C++ 
Lua的特性：
动态执行
嵌入性：做为其他语言的辅助语言

源码包里的源文件 src 都是 C 的文件，也就是说Lua的后台执行是C语言的


/********* 四 Lua的 注释 变量 语句块 ***********/
注释：
-- 表示单行注释
--[[  ......  ]] 表示多行注释

[[  ......  ]] 中可以添加多行文本， 例如：
str = [[ 
	金克拉束带结发克里斯多夫讲课累死
	斯蒂芬克教室里的飞机上的看法
	史蒂夫的说法
	是的范德萨发斯蒂芬
]]
注： --[[  ]] 是多行注释， 而 [[ ]] 是多行文本

变量：Lua中变量没有类型，不需要为变量定义类型，它是一个动态类型。就是想C++11中 auto，也是动态类型， 它可以进行类型推算。 例如:
a = "I'm a"
a = 12  数字类型，没有整形
可以为同一个变量重新赋值，一旦被重新赋值原来的内存空间就被释放了
变量类型：
1.数字类型     
2.字符串类型
3.thread类型		(线程也是个类型)
4.function类型  （函数 也是个类型, 和其他语言区分比较明显的地方， 函数做为类型出现可以声明变量， 使用变量名加参数就可以调用函数
5.tabel类型	   （Lua中的数组，不是jave或C++中的数组，它是融合了链表加上键值对的一个混合体）
6.其他类型	

Lua 中也是有全局 和 局部变量之分
local a = 12      
local修饰的变量，也就是该变量在其他语言中的 私有变量， 如果在函数中就是局部变量。
如果 不加 local，默认全部是全局类型， 只要引入当前Lua文件，就可以使用。 即使在函数中创建，也是全局变量(global)。


/********* 五 Lua中的函数、条件判断语句 ***********/
在Lua中条件判断语句没有 {} (花括号)
	local a = 12
	if a == 12 then
		print ("a's value is 12")
	end
then 和 end 就相当与 { } (花括号), 如果要输入 if else
	if a == 12 then
		print ("a's value is 12")
	elseif a ~= 12 then
		print ("a's value is not 12")
	endl
注： 不等于 是 ~= 符号
Lua中的特殊符号组合： == > < >= <= ~=(不等于)

Lua中的函数的定义
1.不需要返回值
2.参数不需要参数类型
3.如果函数需要别的 Lua 文件调用，不加 local 关键字， 如果不想别的Lua文件调用，最好号加上 local 关键字
4.函数用 end 结尾

Lua中函数的种类：
1.无参数
local function myfunc1()
	print ("myfunc1")
end

2.有参数
local function myfunc2( var )
	print ("myfunc2 --> "..var)
end

3.有参数 有返回值
local function myfunc3( var )
	return var
end

4.有多个返回值   Lua中的函数支持多返回值
local function myfunc4()
	return 5, 10
end 

5.可变长参数  Lua中下标从 1 开始，而不是大多数语言的 从 0 开始
local function myfunc5(...)
	--遍历参数  用 Table 接受
	local myTable = {...}
	for k,v in pairs(myTable) do
		print(k,v)
	end
	print("get value is " ..myTable[1])
end


/********* 六 Lua中的循环语句  逻辑运算关键 ***********/
Lua中 表示假的只有 false nil  而不是 C++ 中的四大假
逻辑运算关键字：
and or : 短路求值， 只会在需要的时候才会去计算，或评估。 不需要的时候会选第一个
/---------------- and ---------------------/
and: 如果我们第一个需要去计算操作的数是假的话，那么就返回第一个操作数。反之返回第二个操作数。 例如：
print (1 and 5)
输出是 5， 因为第一个数 1 不是假，所以返回第二个值 5
print (false and 5)
输出是 false， 因为第一个数 false 是假，所以返回第一个值 false
/----------------- or -------------------/
or: 如果我们第一个需要去计算操作的数是真的话，那么就返回第一个操作数。反之返回第二个操作数。
例如：
print (1 or 5)
输出是 1， 因为第一个数 1 是真，所以返回第一个值 1
print (false or 5)
输出是 5 因为第一个数 false 是假，所以返回第二个值 5

/------------------ Lua 中的循环语句 ---------------------/
/------------------ while 循环 ---------------------/
例：
m_table = {1, 2, 3}
local i = 1
while m_table[i] do
	print (m_table[i])
	i = i + 1
end
在while循环中，没有别的语言的 { }花括号， 取而代之的是 do end
Lua中没有 前++  和  后++

/------------------ repeat (do while) 循环 ---------------------/
repeat  until: 相当于别的语言中 do while, repeat 后面不需要加 do
local x = 1
repeat 
	print ("x value is " ..x)
	x = x + 1
until x == 5


/------------------ for 循环 ---------------------/
1. 如果第三个值是递增，第二个值就是最大值，如果i>最大值跳出循环; 第三个值 2 是每次递增的值，如果不写的话默认是 每次递增 1 
for i = 1, 4, 2 do
	print ("i value is "..i)
end

2. 如果第三个值是递减，第二个值就是最小值，如果i<最小值跳出循环; 第三个值 -2 是每次递减的值，
for i = 15, 1, -2 do
	print ("i value is "..i)
end 

3. 遍历表中所有元素 （#m_table 求出表中元素个数，相当与 count）
for i=1, #m_table, 1 do
	print(m_table[i])
end



/*************** 七 table ***************/
在别的编程语言中，会有 容器  数组  集合  链表等等。
Lua中的 table 就是一个 数据的集合
table的用途：
1.可以做为配置文件
2.当做数据集 (可以做一些逻辑，比如：不同等级角色访问Npc会得到不同的任务。在访问Npc的时候会向服务器发请求，服务器根据角色等级，访问不同的脚本文件。如果是节日做活动，只需要把服务器上的脚本文件更换掉就可以了)
大多数时候是做为数据集的。（注意加密）

建立一个空的table
mytable = {}
建立一个有数据的table
mytable2 = {
	1,
	2,
	3
	4,
}
遍历table  (#mytable2 是获取 table 的长度)
for i = 1, #mytable2 do
	print (mytable2[i])
end
注： Lua中 table 的索引 是从1开始的 不是0
	table 的访问 和 其他语言中的数组访问方式 很类似

table 中的 变量类型可以是 数值类型 也可以 是 字符串类型
mytable3 = {
	2,
	3,
	"hello"
}

在 table 中 添加另外一个 table
mytable4 = {
	2,
	3,
	"Hello",
	config = {1, 2, 3},
	4
}
注: config = {1, 2, 3}不能输出，因为table的一个特性，遍历时按一个顺序来的，如果是一个对象的话不会输出. 但是4能输出，因为这时的 4 的索引是 4


/*************** 八 table 的三种遍历方式 ***************/
Lua会用 table 来模拟对象
table之所以会有三种遍历方式，因为table的复杂型，它支持链表的方式，还是支持键值对的方式。

/----------- table 中可以直接给变量赋值
TrTable = {
	k = 12
}
print (TrTable[k])
这里输出为 nil 是因为在 TrTable 中找不到 索引 k 位置。 
而 TrTable 中的 k 实际上是 key。  

print (TrTable["k"])
正常打印是因为 会通过 "k"(key) 找到所在的索引 然后输出
print (TrTable.k)
这里的 TrTable.k  等价于 TrTable["k"]


/----------- TrTable[tr] 以变量 tr 的值做为 table 的索引
tr = 100
TrTable[tr] = 500;
print (TrTable[tr])

/----------- 第一种遍历方式
for i = 1, #TrTable do
	print ("value is " ..TrTable[i])
end
该方式只能遍历索引连续的元素， 如元素不是 数值类型 或 字符串，那么不会添加索引


/----------- 第二种遍历方式  for  ipairs 
for  ipairs  i:index  v:value  ipairs:只获取 自然索引的元素 ,和普通 for 的结果是一样的， 都是按照当前的自然索引来取值的
for i,v in ipairs(TrTable) do
	print(i,v)
end
自然索引：如果 table 中存放的是 数值类型 或 字符串， table会自动生成自然索引


/----------- 第三种遍历方式  for  pairs 
for  pairs  k:key  v:value  pairs:通过key获取的元素
for k,v in pairs(TrTable) do
  	print(k,v)
 end  
输出的 TrTable1	table: 0x7f9d684084c0 是一个地址，也就是说 table 是一个指针




/*************** 九 table 的简单使用 ***************/
table 做为 配置文件
enemy_datas = {
	{Id = 1, Hp = 100, ATK = 20, DEF = 50},
	{Id = 2, Hp = 100, ATK = 20, DEF = 50},
	{Id = 3, Hp = 100, ATK = 20, DEF = 50},
	{Id = 4, Hp = 100, ATK = 20, DEF = 50},
}

for i=1,#enemy_datas do
	print( enemy_datas[i])
	if type(enemy_datas[i]) == "table" then 
		for k,v in pairs(enemy_datas[i]) do
			print(k,v)
		end
		print "======================"
	end 
end



/*************** 十 lua中的require 和 module ***************/
/----------- lua中的 require
--require 类似于 C++中的 incloud  引入另一个文件（模块 或 包） 


--如果文件是带路径的，加载方式如下
--app/test/cc.lua
require("app.test.cc") 

/----------- lua中的 module （模块 也就是一个 table）
--创建一个 模块  并且在 require 的时候 返回 该对象（table）
myComplex = {
	
}
function myComplex.show( o )
	print (o)
end

--最终返回一个 table
return myComplex;



/*************** 十一 lua中的面向对象 ***************/
--[[lua不是一个面向对象的语言，但是他又有面向对象的思想
lua中的面向对象是伪面向对象，伪面向对象就要用到table实现，
是table模拟了一个面向对象的编程， table其实也可以看做是一个对象，
和其他语言对象一样有个自身的标示（self），具有自己的生命周期。]]

--1.用table实现面向对象


--2.通过 self 得到当前 lable 对象


--3.通过 : 符号，实现声明函数时的  隐试参数 self


--4.通过require 返回对象， 调用该对象方法


/*************** 十一 lua读写文件 ***************/

--读取
local function read_file( filename )
	local f = assert(io.open(filename,'r'))
	local content = f:read("*all")
	f:close()
	return content
end
local rlt = read_file("a.txt")
print(rlt)

--写入
local function write_content( filename,content )
	local f = assert(io.open(filename,'w'))
		f:write(content)
	f:close()
	-- body
end

local text = [[
你好啊
]]
write_content("ok.txt",text)
