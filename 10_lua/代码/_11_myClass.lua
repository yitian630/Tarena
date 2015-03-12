
local myClass =  {
	name = "Tarena",
	--如果函数在 表的 花括号中  需要传入self的时候，必须显示的传入
	show = function ( self )
		print ("name is "..self.name)
	end
}

function myClass:showName()
	print ("name is "..self.name)
end

return myClass