
--用table来实现面向对象
Accout = { balance = 100 }
function Accout.conut( v )
	print ("value is "..v)
end


accout = Accout
accout.conut(20000)


--用 self 得到当前对象 
Accout = { balance = 100 }
function Accout.conut( self , v )
	self.balance = self.balance + v
	print ("value is "..self.balance)
end
accout = Accout
--显示传入 self   通过参数 把 自身 传到方法中
accout.conut( accout , 20000)
--隐士传入self  隐士传入是通过 : 符号调用函数
accout:conut(30000)


--声明方法 隐士带 self 参数
Accout = { balance = 100 }
function Accout:conut( v )
	self.balance = self.balance + v
	print ("value is "..self.balance)
end
accout = Accout
--隐士传入self  隐士传入是通过 : 符号调用函数
accout:conut(40000)



--通过require 返回对象， 调用对象的方法
class = require("_11_myClass")
--table 花括号内的方法  显示传入self
class.show(class)
--table 花括号外的方法  隐士传入self
class:showName()








