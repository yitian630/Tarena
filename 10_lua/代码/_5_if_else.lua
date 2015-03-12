--判断语句
local a = 15

-- ~=不等于
if a ~= 15 then
	print ("value is "..a)
end


if a == 12 then
	print ("value is 12")
elseif a == 18 then
	print ("value is 12")
else 
	print ("value is 15")
end

--函数
--无参数
local function myFunc1()
	print "myFunc1"
end
myFunc1()

--带参数
local function myFunc2( var )
	print ("myFunc2 var = "..var)
end
myFunc2("Hello")
myFunc2(1234)

--带参数 带返回值
local function myFunc3( var )
	return var
end
print (myFunc3("Hello"))

--带参数  带多个返回值
local function myFunc4( var )
	return 5+var, 10+var
end
local x , y = myFunc4(20)
print ("x = "..x.."   y = "..y)

--带多个参数 （可变长）
local function myFunc5( ... )
	--用 Table 来接受 变长参数
	local myTable = { ... }
	for i,v in ipairs(myTable) do
		print(i,v)
	end
	print ("value is "..myTable[3])
end
myFunc5("Hello", "lua", 1402)






