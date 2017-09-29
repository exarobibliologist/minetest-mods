local comps={
	{"digilines","digilines"},
	{"mesecons","mesecons"},
	{"moremobs","mobs"},
	{"mobs","mobs"},
}

local getModName=function(name,player)
	if betterCreativeInventory.players[player:get_player_name()].set_sort~="s" then
		if betterCreativeInventory.getTrans(player)[name]~=nil then
			return betterCreativeInventory.getTrans(player)[name]
		end
		--print("processed :"..name)
	end
	local mod = name:sub(0,(name:find(':')))
	mod=mod:sub(0,mod:len()-1)
	local i=0
	for i=1,#comps do
		if strs:starts(mod,comps[i][1]) then
			mod=comps[i][2]
			return mod
		end
	end
	if betterCreativeInventory.players[player:get_player_name()].set_sort=="c" then
		for i=1,#betterCreativeInventory.category.move do
			if strs:starts(mod,betterCreativeInventory.category.move[i][1]) then
				mod=betterCreativeInventory.category.move[i][2]
				return mod
			end
		end
	end
	--print(name)
	if betterCreativeInventory.players[player:get_player_name()].set_sort=="c" then
		return "undefined"
	end
	return mod
end

local visible=function(def,player)
--	if betterCreativeInventory.isStairsMode(player) then
--		local name = def.name
--		local mod = name:sub(0, name:find(':'))
--		name = strs:rem_from_start(name, mod)
--		local prefix = name:sub(0, name:find('_'))
--		--local prefix = string.gmatch(name, "_")[2]
--		local base = strs:rem_from_start(name, prefix)
--		if mod=="moreblocks:" then
--			base = "default:" .. base
--		else
--			base = mod .. base
--		end
--		--print(base)
--		if betterCreativeInventory.players[player:get_player_name()].stairs_set_item~=nil and
--				base ~= betterCreativeInventory.players[player:get_player_name()].stairs_set_item then
--			return false
--		end
--		--print(name)
--		local names = {"stair", "slab", "panel", "micro"}
--		local lastnames = {""}
--		for j=1, #lastnames do
--			for i=1, #names do
--				--if strs:ends(name, lastnames[i]) then
--					if strs:starts(strs:rem_from_end(name, lastnames[i]), names[i].."_") then
--						------------------------
--						------------------------
--						--print(name)
--						return true
--					end
--				--end
--			end
--		end
--		return false
--	end
	
	if betterCreativeInventory.getShow(player)[def.name]~=nil and betterCreativeInventory.players[player:get_player_name()].set_sort~="s" then
		return betterCreativeInventory.getShow(player)[def.name]
	end
	if (not def.groups.not_in_creative_inventory or def.groups.not_in_creative_inventory == 0)
				and def.description and def.description ~= "" then
		return true
	end
	return false
end

betterCreativeInventory.populate=function(inv,player,playername,selectedMod,start)
	if betterCreativeInventory.isStairsMode(player) and 
				betterCreativeInventory.players[player:get_player_name()].stairs_set_item~=nil then
		local name = betterCreativeInventory.players[player:get_player_name()].stairs_set_item
		local mod = name:sub(0, name:find(':')-1)
		--mod = mod:sub(0, mod:len() - 1)
		name = strs:rem_from_start(name, mod..":")
		if(mod == "default") then mod = "moreblocks"; end
		--print(mod..":"..name)
		inv:set_size(playername, 0)
		inv:set_size(playername, 4*8)
		inv:set_list(playername, circular_saw.get_stair_output_inv(mod, name, 9999, nil))
		return
	end
	--print(start)
	local creative_list = {}
	local creative_list_mods = {}
	local mod_list={}
	local tmp_mod_sizes={}
	local mod_sizes={}
	local last=""
	local i=0
	local count=0
	local itemCount=0
	for name,def in pairs(minetest.registered_items) do
		if visible(def,player)==true then
			table.insert(creative_list, name)
		end
	end
	--print("ok.a")
	table.sort(creative_list)
	--inv:set_size("main", #creative_list)

	for _,itemstring in ipairs(creative_list) do
		local stack = ItemStack(itemstring)
		local name = stack:get_name()
		local mod = getModName(name,player)
			
--		if mod~=last and last~="" then
--			mod_list[i]=last
--			i=i+1
--			count=0
--		end
		count=count+1
		if mod_sizes[mod]==nil then
			mod_sizes[mod]=0
		end
		mod_sizes[mod]=mod_sizes[mod]+1
		last=mod
	end
	table.sort(mod_sizes)
	--print("ok.b")
	
	--mod_sizes["all"] = #creative_list
	inv:set_size(playername, 0)
	inv:set_size(playername, 4*8)
	--if selectedMod==nil then
	--	inv:set_size(playername, #creative_list)
	--else
	--	inv:set_size(playername, mod_sizes[selectedMod])
	--end
	
	count=0
	itemCount=0
	for _,itemstring in ipairs(creative_list) do
		local stack = ItemStack(itemstring)
		local stack2 = nil
		local name=stack:get_name()
		local mod=getModName(name,player)
		stack2=ItemStack(stack:get_name().." "..stack:get_stack_max())
		
		if selectedMod==nil or selectedMod==mod or (selectedMod=="stairs" and betterCreativeInventory.isStairsMode(player)) then
			count=count+1
			itemCount = itemCount + 1
			if count>=start and count<start+(4*8) then
				--print(mod)
				inv:add_item(playername, stack2)
			end
		end
		
		if betterCreativeInventory.icon_map["d"]~=nil and betterCreativeInventory.icon_map["d"][mod] == nil then
			betterCreativeInventory.icon_map["d"][mod] = name
		end
	end
	
	mod_list = {}
	for name, val in pairs(mod_sizes) do
		--mod_list[#mod_list+1] = name
		table.insert(mod_list, name)
	end
	table.sort(mod_list)
	tmp_mod_sizes = mod_sizes
	mod_sizes = {}
	for i=1, #mod_list do
		local name = mod_list[i]
		mod_sizes[name] = tmp_mod_sizes[name]
	end
	
	if betterCreativeInventory.isStairsMode(player)==false then
		betterCreativeInventory.mods = mod_sizes
		--betterCreativeInventory.mods.search = 1
		if betterCreativeInventory.players[player:get_player_name()].set_sort=="c" and minetest.get_modpath("moreblocks") ~= nil then
			betterCreativeInventory.mods.stairs = 1
		end
	end
	betterCreativeInventory.players[player:get_player_name()].inv_size=itemCount
	--print("ok")
end

betterCreativeInventory.isStairsMode = function(player)
	if betterCreativeInventory.players[player:get_player_name()].mod=="stairs"
				and betterCreativeInventory.players[player:get_player_name()].set_sort=="c" then
		return true
	end
	return false
end