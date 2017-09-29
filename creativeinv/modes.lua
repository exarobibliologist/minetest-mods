betterCreativeInventory.strict={}
betterCreativeInventory.strict.trans = {}
betterCreativeInventory.strict.show={}
----------------------------------------------------------------------------------------------------
betterCreativeInventory.category={}
betterCreativeInventory.category.trans = {}
-- the rest will be loaded later on.
-------------------------------------
betterCreativeInventory.category.move = {}

betterCreativeInventory.category.show={}
betterCreativeInventory.category.show["bucket:bucket_water"] = true
betterCreativeInventory.category.show["bucket:bucket_lava"]  = true
betterCreativeInventory.category.show["oil:bucket_oil"]      = true
betterCreativeInventory.category.show["cooked_rat"]          = false
betterCreativeInventory.category.show["rat"]                 = false
betterCreativeInventory.category.show["default:lava_source"] = false
betterCreativeInventory.category.show["default:water_source"]= false
betterCreativeInventory.category.show["oil:oil_flowing"]= false
betterCreativeInventory.category.show["oil:oil_source"] = false
betterCreativeInventory.category.show["carts:interface"]= false
-------------------------------------------------------------------------------------------------------
betterCreativeInventory.loose={}
betterCreativeInventory.loose.trans = {}
betterCreativeInventory.loose.trans["oil:fuel_bucket"] = "bucket"
betterCreativeInventory.loose.trans["oil:bucket_oil"] = "bucket"
-------------------------------------
betterCreativeInventory.loose.show={}
betterCreativeInventory.loose.show["bucket:bucket_water"] = true
betterCreativeInventory.loose.show["bucket:bucket_lava"]  = true
betterCreativeInventory.loose.show["oil:bucket_oil"]      = true
betterCreativeInventory.loose.show["cooked_rat"]          = false
betterCreativeInventory.loose.show["rat"]                 = false
---------------------------------------------------------------------------------------------------------
betterCreativeInventory.view = {
	i = {
		h=10,
		hs = 1,
		v=1,
	},
	c = {
		h=8,
		hs = 1,
		v=1,
	},
	t = {
		h=5,
		hs = 1,
		v=1,
	},
}
---------------------------------------------------------------------------------------------------------

betterCreativeInventory.getTrans=function(player)
	return betterCreativeInventory.getCatList(player).trans
end

betterCreativeInventory.getShow=function(player)
	return betterCreativeInventory.getCatList(player).show
end

betterCreativeInventory.getCatList=function(player)
	if betterCreativeInventory.players[player:get_player_name()].set_sort=="l" then
		return betterCreativeInventory.loose
	elseif betterCreativeInventory.players[player:get_player_name()].set_sort=="c" then
		return betterCreativeInventory.category
	elseif betterCreativeInventory.players[player:get_player_name()].set_sort=="s" then
		return betterCreativeInventory.strict
	end
end


betterCreativeInventory.loadSettingsFromFile=function(filename, conn)
--	local modpath = minetest.get_modpath("createiveinv")
	dofile(minetest.get_modpath("creativeinv")..filename)
	for name, val in pairs(betterCreativeInventory.loader.map) do
		for i=1,#val do
			conn[val[i]] = name
		end
	end
--	local buffer=""
--	io.input(modpath..filename)
--	
--	local size = 2^10		-- good buffer size (1K)
--	while true do
--		local block = io.read(size)
--		if not block then break end
--		buffer=buffer..block
--	end
--	buffer="\n"..buffer
--	local lines = buffer:split("\n")
--	local default=""
--	for i=1,#lines do
--		if lines[i]~="" then
--			local from
--			if lines[i]:find(' ')~=nil then
--				from=lines[i]:sub(0,lines[i]:find(' ')-1)
--			else
--				from=lines[i]
--			end
--			local to=" "..default.." "
--			local occor=lines[i]:find('"')
--			if occor~=nil then
--				to=lines[i]:sub(occor)
--			end
--			--if to=="" then
--			--	to=default
--			--end
--			to=to:sub(2,to:len()-1)
--			if from=="!" then
--				default=to
--			end
--			conn[from]=to
--		end
--		--print(to)
--	end
--	--betterCreativeInventory.category.trans["default:iorn_lump"] = "lumps and ingots"
--	--local line=" "
--	--while line~="" and line~=nil do
--	--	line=buffer:sub(1,buffer:find('\n')-1)
--	--	print("line:"..line)
--	--	buffer=buffer:sub(buffer:find('\n'))
--	--end
end

betterCreativeInventory.loadSettingsFromFile("/settings/sorts/c/itemMap.lua", betterCreativeInventory.category.trans)