enemy_datas = {
	{Id = 1, Hp = 100, ATK = 20, DEF = 50},
	{Id = 2, Hp = 100, ATK = 20, DEF = 50},
	{Id = 3, Hp = 100, ATK = 20, DEF = 50},
	{Id = 4, Hp = 100, ATK = 20, DEF = 50},
}

for i=1,#enemy_datas do
	print( enemy_datas[i])
	if type(enemy_datasp[i]) == "table" then 
		for k,v in pairs(enemy_datas[i]) do
			print(k,v)
			--创建敌人对象
		end
		print "======================"
	end 
end






