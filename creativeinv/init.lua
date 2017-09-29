minetest.register_privilege("creative", {
	description = "Player can use creative inventory.",
	give_to_singleplayer = false,
})

minetest.register_privilege("pickpocket", {
	description = "Player can pick other players pockets.",
	give_to_singleplayer = false,
})

minetest.register_craftitem("creativeinv:searchicon", {
	description = "Search for items",
	inventory_image = "creativeinv_search.png",
	groups = {not_in_creative_inventory=1},
})

dofile(minetest.get_modpath("creativeinv").."/saveplayers.lua")

betterCreativeInventory = {}
betterCreativeInventory.players = {}
betterCreativeInventory.ldplayers = {}
minetest.after(0, function()
-----------------------------------------
minetest.register_on_joinplayer(function(player)
    inventory_plus.register_button(player,"creativeinv","items")
end)
----------------------------------------
function table.contains(table, element)
  for _, value in pairs(table) do
    if value == element then
      return true
    end
  end
  return false
end
----------
function math.toint(num)
	if num>0 then
		local ii=0
		for i=0,num do ii=i end
		return ii
	end
	return num
end
-------------------------------------------
betterCreativeInventory.start=0
dofile(minetest.get_modpath("creativeinv").."/modes.lua")
dofile(minetest.get_modpath("creativeinv").."/modInvs.lua")
dofile(minetest.get_modpath("creativeinv").."/populate.lua")
dofile(minetest.get_modpath("creativeinv").."/uimenus.lua")

betterCreativeInventory.get_formspec = function(player)
	return betterCreativeInventory.get_formspecAvc(player,0,1)
end

-- each time a player clicks an inventory button, this is called
minetest.register_on_player_receive_fields(function(player, formname, fields)
	
	local redraw = false
	
	-- your_mod_name was clicked from the main inventory page
	if fields.creativeinv then
		-- setup the inventory formspec
		inventory_plus.set_inventory_formspec(player, "size[2.5,1]label[0,0.55;loading]")
		if betterCreativeInventory.players[player:get_player_name()]==nil then
			betterCreativeInventory.players[player:get_player_name()] =
							betterCreativeInventory.ldplayers[player:get_player_name()] or {
				mod=nil,  --      the selected mod
				pg=1,	  --      the current page (page 1=4*8*1, page 2=4*8, page 3=4*8*3 etc etc)
				inv_size=1,--     the inventory size
				set_sort="l",--   the sort mode:"s"=by mod,strict;"l"=by mod,loose;"c"=by category
				set_view = "t",-- t=view as text, i=view as icon, c=view as icons around inventory
				search = "", --   the search term
				stairs_set_item = nil,
				stairs_set_pg = 0,
				userview = nil,
			}
			
			if betterCreativeInventory.players[player:get_player_name()].mod=="stairs" then
				betterCreativeInventory.players[player:get_player_name()].mod = nil
			end
			
			local prefs = betterCreativeInventory.players[player:get_player_name()]
			
			if prefs.userview == nil then
				prefs.userview = player:get_player_name()
			end
			--minetest.after(1,function()
			betterCreativeInventory.creInv:set_size("view_player_"..player:get_player_name(), 1)
			betterCreativeInventory.populate(betterCreativeInventory.creInv,player,"player_"..player:get_player_name(),prefs.mod,prefs.pg)
			--end)
			--print("init")
			--return
		end
		inventory_plus.set_inventory_formspec(player, betterCreativeInventory.get_formspec(player))
		--print("showen")
	end
	
	-- some button was clicked
	if fields.bettercreative_mods then
		-- setup the inventory formspec
		inventory_plus.set_inventory_formspec(player, betterCreativeInventory.get_formspecMods(player))
		
		-- user clicked the button, better do something here
	end
	if fields.bettercreative_settings then
		-- setup the inventory formspec
		inventory_plus.set_inventory_formspec(player, betterCreativeInventory.get_formspecSettings(player))
		
		-- user clicked the button, better do something here
	end
	if fields.bettercreative_view then
		-- setup the inventory formspec
		inventory_plus.set_inventory_formspec(player, betterCreativeInventory.get_formspecView(player))
		
		-- user clicked the button, better do something here
	end
	---------------------
	for item,value in pairs(fields) do
		--if value==true then
			if strs:starts(item,"bettercreative_mod_")==true then
				local selectedMod=strs:rem_from_start(item,"bettercreative_mod_")
				--print(selectedMod)
				inventory_plus.set_inventory_formspec(player, "size[2.5,1]label[0,0.55;loading]")
				betterCreativeInventory.players[player:get_player_name()].mod=selectedMod
				betterCreativeInventory.populate(betterCreativeInventory.creInv,player,"player_"..player:get_player_name(),selectedMod,1)
				inventory_plus.set_inventory_formspec(player, betterCreativeInventory.get_formspecAvc(player,0,1))
				betterCreativeInventory.players[player:get_player_name()].pg=1
			end
			-------------------------------------------------------
			if strs:starts(item,"bettercreative_settings_sort_")==true then
				local sort=strs:rem_from_start(item,"bettercreative_settings_sort_")
				--print(selectedMod)
				inventory_plus.set_inventory_formspec(player, "size[2.5,1]label[0,0.55;loading]")
				betterCreativeInventory.populate(betterCreativeInventory.creInv,player,"player_"..player:get_player_name(),nil,1)
				inventory_plus.set_inventory_formspec(player, betterCreativeInventory.get_formspecAvc(player,0,1))
				betterCreativeInventory.players[player:get_player_name()].set_sort=sort
				fields.bettercreative_all = true
			end
			--------------------------------------------------------
			if strs:starts(item,"bettercreative_settings_view_")==true then
				local view=strs:rem_from_start(item,"bettercreative_settings_view_")
				--print(selectedMod)
				inventory_plus.set_inventory_formspec(player, "size[2.5,1]label[0,0.55;loading]")
				betterCreativeInventory.populate(betterCreativeInventory.creInv,player,"player_"..player:get_player_name(),nil,1)
				inventory_plus.set_inventory_formspec(player, betterCreativeInventory.get_formspecAvc(player,0,1))
				betterCreativeInventory.players[player:get_player_name()].set_view=view
				fields.bettercreative_all = true
			end
			--------------------------------------------------------
			if strs:starts(item, "bettercreative_stairs_item_")==true then
				local item=strs:rem_from_start(item, "bettercreative_stairs_item_")
				if item=="all" then item=nil end
				betterCreativeInventory.players[player:get_player_name()].stairs_set_item=item
				redraw = true
			end
			--------------------------------------------------------
			if strs:starts(item, "bettercreative_pickplayer_")==true then
				local item=strs:rem_from_start(item, "bettercreative_pickplayer_")
				betterCreativeInventory.players[player:get_player_name()].userview = item
				redraw = true
			end
		--end
	end
	if fields.bettercreative_all then
		inventory_plus.set_inventory_formspec(player, "size[2.5,1]label[0,0.55;loading]")
		betterCreativeInventory.populate(betterCreativeInventory.creInv,player,"player_"..player:get_player_name(),nil,1)
		inventory_plus.set_inventory_formspec(player, betterCreativeInventory.get_formspecAvc(player,0,1))
		betterCreativeInventory.players[player:get_player_name()].pg=1
	end
	-----------------------------------------------------------
	if fields.bettercreative_stairs_next or fields.bettercreative_stairs_prev then
		local stairs_pg = betterCreativeInventory.players[player:get_player_name()].stairs_set_pg
		if fields.bettercreative_stairs_next then
			betterCreativeInventory.players[player:get_player_name()].stairs_set_pg=math.min(stairs_pg + 1,
						math.floor(#circular_saw.known_stairs/7))
		elseif fields.bettercreative_stairs_prev then
			betterCreativeInventory.players[player:get_player_name()].stairs_set_pg=math.max(stairs_pg-1, 0)
		end
		redraw = true
	end
	-----------------------------------------------------------
	
	-----------------
	if fields.bettercreative_pick then
		inventory_plus.set_inventory_formspec(player, betterCreativeInventory.get_formspecPlayers(player))
	end
	-----------------
	
	---------------------
	if fields.bettercreative_next or fields.bettercreative_prev or redraw then
		local formspec = player:get_inventory_formspec()
		---------------
		local current_page = 0
		--local start_i = string.match(formspec, "list%[detached:betterCreativeInventoryCreInv;player_"..player:get_player_name()..";[%d.]+,[%d.]+;[%d.]+,[%d.]+;(%d+)%]")  --  =betterCreativeInventory.start
		local start_i = betterCreativeInventory.players[player:get_player_name()].pg
		-------------
		--local inventorySize=betterCreativeInventory.creInv:get_size("player_"..player:get_player_name())
		local inventorySize = betterCreativeInventory.players[player:get_player_name()].inv_size
		--print("main:"..inventorySize)
		-------------
		
		--start_i = tonumber(start_i) or 0
		
		
		if fields.bettercreative_prev then
			start_i = start_i - 4*8
		end
		if fields.bettercreative_next then
			start_i = start_i + 4*8
			--print("OOKK: "..start_i)
		end
		--print("start_i: "..start_i)
		if start_i < 0 then
			--start_i = start_i + 4*8
			start_i=0
		end
		if start_i > inventorySize then
			-- betterCreativeInventory.size then
			start_i = start_i - 4*8
		end
		betterCreativeInventory.players[player:get_player_name()].pg = start_i
		betterCreativeInventory.populate(betterCreativeInventory.creInv,player,"player_"..player:get_player_name()
					,betterCreativeInventory.players[player:get_player_name()].mod,start_i)
		inventory_plus.set_inventory_formspec(player, betterCreativeInventory.get_formspecAvc(player,math.toint(start_i/(4*8)+1)))
		--betterCreativeInventory.start=start_i
	end
end)
dofile(minetest.get_modpath("creativeinv").."/loadplayers.lua")
betterCreativeInventory.loadSettingsFromFile()
end)