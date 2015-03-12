

--TrTable = {
--	k = 12
--	tr = "Lua"
--}
--把 k 看成索引 而不是  key
-- print (TrTable[k])
-- 通过 key  k  输出
--print (TrTable["k"])
--print (TrTable.k)
--
----通过索引输出
--tr = 100
--TrTable[tr] = 500
--print (TrTable.tr)


TrTable = {
	k = 200,
	2, --1
	3, --2
	4, --3
	TrTable1 = {2, 5},
	x = 500,
	"Hello"--4
}
--第一种遍历方式
--[[ 该方式只能遍历索引连续的元素， 如果元素不是 数值类型 或 字符串类型， 那么不会添加索引]]
for i = 1, #TrTable do
	print ("Value is "..TrTable[i])
end

--第二种遍历方式
--ipairs 只获取 表中 自然索引 和对应元素
for i,v in ipairs(TrTable) do
	print(i,v)
end

--第三种遍历方式 获得表中key value,输出table1 对应的value是一个指针（地址）
for k,v in pairs(TrTable) do
	print(k,v)
end

