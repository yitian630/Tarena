--这是一句打印
print "Hello lua"

--[[  表示多行注释
sdf
sdfsdfsdf
sdfsdfsdf
sdfsdf
  ]] 

--多行文本
 str = [[ 字符串字符串字符串字符串
 字符串字符串字符串字符串
 字符串字符串字符串字符串
 字符串字符串字符串]]



 a = 123.123
 a = "sdfsdfdsf"

--用函数类型 声明变量a
 a = function ( var )
 	print ("function "..var.." sdfsdf")
 end
 a("Hello World")
 a(1234)

 --tabel类型
 myTabel = {
 	123,
 	"sdfdsf",
 	2222
}
--直接输出是一个地址  
print (myTabel)
--循环遍历
for i,v in ipairs(myTabel) do
	print(i,v)
end

















