
--空得Table
TrTable = {}



--有数据的Table
TrTable2 = {
	1,
	2,
	3,
	4
}
for i = 1, #TrTable2 do
	print(TrTable2[i])
end

--表中 也可以放 字符串
TrTable3 = {
	1,
	"Hello",
	3,
	4
}
for i = 1, #TrTable3 do
	print(TrTable3[i])
end

--表中 还可以再 放表
TrTable4 = {
	1, --1
	"Hello", --2
	TrTable = {1, 2, 3},
	3,--3
	4--4
}
-- 1  Hello  3  4
for i = 1, #TrTable4 do
	print(TrTable4[i])
end







