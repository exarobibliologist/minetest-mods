-- get_formspec to use when your button is clicked
betterCreativeInventory.get_formspecAvc = function(player, pg)
	-----------------------------------
	--print("start"..strt)
	--print(minetest.get_player_privs(player))
	local can_access = minetest.check_player_privs(player:get_player_name(), {creative=true})
	--local can_access = table.contains(minetest.get_player_privs(player:get_player_name()),"creative")
	if minetest.setting_getbool("creative_mode")==false
			and can_access==false then
		return "size[3,3]button[0,0;2,0.5;main;Back]label[0,0.55;missing perms:creative]"
	end
	--------------------------------
	--local inventorySize=betterCreativeInventory.creInv:get_size("player_"..player:get_player_name())
	local inventorySize = betterCreativeInventory.players[player:get_player_name()].inv_size
	local vshift = 0
	local search = 0
	if betterCreativeInventory.players[player:get_player_name()].set_view=="c" then
		vshift = vshift + 1
	end
	
	if betterCreativeInventory.players[player:get_player_name()].mod=="search" then
		search = 1
		vshift = vshift + 0.75
	end
	--print("getFS:"..inventorySize)
	--print(inventorySize)
	--print("mod: "..mode)
    local formspec = "size[12,"..(9+vshift).."]" -- size of the formspec page
        .."button[0,0;2,0.5;main;Back]" -- back to main inventory
        .."button[0,3.6;2,0.5;bettercreative_view;Anilise item]" -- show all the installed mods
		.."list[detached:betterCreativeInventoryCreInv;player_"..player:get_player_name()..";2,"..vshift..";8,4;]"
		.."label[2.0,7.55;"..tostring(pg).."/"..tostring(math.toint(inventorySize/(4*8))+1).."]"
		.."button[0.3,6.5;1.6,1;bettercreative_prev;prev]"
		.."button[0.3,7.5;1.6,1;bettercreative_next;next]"
		.."list[player:"..betterCreativeInventory.players[player:get_player_name()].userview..";main;2,"..(5+vshift)..";8,4;]"
	
	if betterCreativeInventory.players[player:get_player_name()].set_view=="c" then
		formspec = betterCreativeInventory.fs_show_mods(formspec, player)
		formspec = formspec
	        .."button[0,2.0;2,0.5;bettercreative_settings;Settings]" -- settings
    	    .."button[0,2.7;2,0.5;bettercreative_all;All]" -- a button that does something in your gui
	else
		formspec = formspec
			.."button[0,3;2,0.5;bettercreative_mods;Sort By Mod]" -- show all the installed mods
	end
	
	if search==1 then
		formspec = formspec
			.."field[2.25,"..(vshift-0.25)..";8,0.5;bettercreative_search_box;Search;"..(betterCreativeInventory.players[player:get_player_name()].search or "").."]" -- show all the installed mods
	end
	
	if betterCreativeInventory.players[player:get_player_name()].mod=="search" then
		--formspec = formspec
	end
	
	if betterCreativeInventory.isStairsMode(player) then
		formspec = formspec .. betterCreativeInventory.fs_get_stairs_list(
					betterCreativeInventory.players[player:get_player_name()].stairs_set_pg, player)
	end
	
	formspec = formspec .. betterCreativeInventory.get_playerbutton(player)
	
	return formspec
end

-- get_formspec to use when your button is clicked
betterCreativeInventory.get_formspecMods = function(player,strt,pg)
	-----------------------------------
	--print(minetest.get_player_privs(player))
	local can_access = minetest.check_player_privs(player:get_player_name(), {creative=true})
	--local can_access = table.contains(minetest.get_player_privs(player:get_player_name()),"creative")
	if minetest.setting_getbool("creative_mode")==false
			and can_access==false then
		return "size[3,3]button[0,0;2,0.5;main;Back]label[0,0.55;missing perms:creative]"
	end
	--------------------------------
	local view_mode = betterCreativeInventory.players[player:get_player_name()].set_view
	if view_mode=="c" then
		return betterCreativeInventory.get_formspecAvc(player, 1)
	end
	--------------------------------
    local formspec = "size[12,9]" -- size of the formspec page
    	.."button[0,0;2,0.5;main;Back]" -- back to main inventory
    	.."button[0,2.7;2,0.5;bettercreative_all;All]" -- a button that does something in your gui
    	.."button[0,2.0;2,0.5;bettercreative_settings;Settings]" -- settings
	
	formspec = betterCreativeInventory.fs_show_mods(formspec, player)
	
	return formspec
end


betterCreativeInventory.get_formspecSettings = function(player)
    local formspec = "size[12,9]" -- size of the formspec page
        .."button[0,0;2,0.5;main;Back]" -- back to main inventory
        .."button[0,2;2,0.5;bettercreative_mods;Sort By Mod]" -- show all the installed mods
		.."button[2.5,2.5;2.48,1;bettercreative_settings_sort_s;Sort by mod:strict]"
		.."button[5.0,2.5;2.48,1;bettercreative_settings_sort_l;Sort by mod:loose]"
		.."button[7.5,2.5;2.48,1;bettercreative_settings_sort_c;Sort by category]"
		---------------------------
		.."button[2.5,4;2.48,1;bettercreative_settings_view_t;View as text]"
		.."button[5.0,4;2.48,1;bettercreative_settings_view_i;View as icon]"
		.."button[7.5,4;2.48,1;bettercreative_settings_view_c;View as icon around inventory]"
	return formspec
end

betterCreativeInventory.get_formspecView = function(player)
	local listname = "view_player_"..player:get_player_name()
    local formspec = "size[12,9]" -- size of the formspec page
        .."button[0,0;2,0.5;main;Back]" -- back to main inventory
        .."button[0,2;2,0.5;bettercreative_mods;Sort By Mod]" -- show all the installed mods
        .."list[current_player;main;2,5;8,4;]"
        .."label[3,0;"..betterCreativeInventory.creInv:get_stack(listname, 1):get_name().."]"
        .."list[detached:betterCreativeInventoryCreInv;"..listname..";2,0;1,1;]"
	return formspec
end

betterCreativeInventory.fs_show_mods = function(formspec, player)
	local x=0
	local y=0
	--for tmp=0,#(betterCreativeInventory.mods) do
	local view_mode = betterCreativeInventory.players[player:get_player_name()].set_view
	local view_max = betterCreativeInventory.view[betterCreativeInventory.players[player:get_player_name()].set_view]
	for mod, size in pairs(betterCreativeInventory.mods) do
		if mod~="hidden" then
			--print(mod)
			--local mod=betterCreativeInventory.mods[tmp]
			if view_mode=="t" then
				formspec=formspec.."button["..(2+(x*2.0))..","..(y/1.5)..";2,0.5;bettercreative_mod_"
					..mod..";"..mod.." ("..size..")]"
			end
			if view_mode=="i" then
				local icon = betterCreativeInventory.fs_get_mod_icon(mod, player)
				if icon~=nil then
					formspec=formspec.."item_image_button["..(2+x)..","..(y)..";1,1;"..icon..";bettercreative_mod_"..mod..";"..mod.."]"
				end
			end
			if view_mode=="c" then
				local icon = betterCreativeInventory.fs_get_mod_icon(mod, player)
				local the_y = y
				if y>0 then the_y=the_y+4 end
				if icon~=nil then
					formspec=formspec.."item_image_button["..(2+x)..","..(the_y)..";1,1;"..icon..";bettercreative_mod_"..mod..";"..mod.."]"
				end
			end
			x=x+view_max.hs
			if x>view_max.h-1 then
				x=0
				y=y+view_max.v
			end
		end
	end
	return formspec
end

betterCreativeInventory.fs_get_mod_icon = function(mod, player)
	local sort_mode = betterCreativeInventory.players[player:get_player_name()].set_sort
	return betterCreativeInventory.icon_map[sort_mode][mod] or betterCreativeInventory.icon_map.d[mod] or "unknowen_item.png"
end

betterCreativeInventory.fs_get_stairs_list = function(pg, player)
	local formspec = ""
	for i=1, 7 do
		local item = circular_saw.known_stairs[i+(pg*7)]
		local all = ""
--		if i==1 and pg==1 then
--			all = "all"
--		end
		if item~=nil and minetest.registered_items[item]~=nil then
			formspec = formspec ..
					"item_image_button[10,"..i..";1,1;"..item..";bettercreative_stairs_item_"..item..";"..all.."]"
		end
	end
	formspec = formspec
			.. "image_button[10,0;1,1;default_dirt.png;bettercreative_stairs_prev;prev]"
			.. "image_button[10,8;1,1;default_dirt.png;bettercreative_stairs_next;next]"
			.. "label[10,8.75;"..(pg+1).."/"..math.floor(#circular_saw.known_stairs/7+1).."]"
	return formspec
end
betterCreativeInventory.get_playerbutton = function(player)
	local formspec = ""
--	local can_access = minetest.check_player_privs(player:get_player_name(), {pickpocket=true})
--	if can_access then
--		formspec = formspec
--				.. "button[0,2;2,0.5;bettercreative_pick;Other players]"
--	end
	return formspec
end

-- get_formspec to use when your button is clicked
betterCreativeInventory.get_formspecPlayers = function(player)
	--------------------------------
    local formspec = "size[12,9]" -- size of the formspec page
    	.."button[0,0;2,0.5;main;Back]" -- back to main inventory
    	.."button[0,2.7;2,0.5;bettercreative_all;All]" -- a button that does something in your gui
    	.."button[0,2.0;2,0.5;bettercreative_settings;Settings]" -- settings
	
	local playerList = minetest.get_connected_players()
	local x=0
	local y=0
	for i = 1, #playerList do
		local localPlayer = playerList[i]
		local playerName = localPlayer:get_player_name()
		formspec=formspec.."button["..(2+(x*2.25))..","..(y/1.5)..";2,0.5;bettercreative_pickplayer_"..playerName..";"..playerName.."]"
		
		x=x+1
		if x>3 then
			x=0
			y=y+view_max.v
		end
	end
	
	return ""--formspec
end

dofile(minetest.get_modpath("creativeinv").."/settings/itemIcons.lua")