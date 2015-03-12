--创建一个 模块    requir(myComplex)  返回的是一个对象
local myComplex = {
	-- name = "1402"
	-- show = function ( o )
	-- 	print (o)
	-- end
}
	myComplex.name = "1402"
	function myComplex.show(o)
		print (o)
	end

--最终返回一个 table
return myComplex