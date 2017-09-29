betterCreativeInventory.creInv = minetest.create_detached_inventory(
			"betterCreativeInventoryCreInv", {
    -- allow_* - return value is the number of items allowed to move, or -1 to copy the stack instead of move
 
    -- Called when a player wants to move items inside the inventory
    allow_move = function(inv, from_list, from_index, to_list, to_index, count, player)
        --if minetest.setting_getbool("creative_mode") then
        --    return count
        --else
		return 0
        --end
    end,
    allow_put = function(inv, listname, index, stack, player)
        --if minetest.setting_getbool("creative_mode")
		--or minetest.check_player_privs(player, {creative=true})
	--	then
		if strs:starts(listname,"view_") then
			return stack:get_count()
		end
		return -1
        --else
        --    return 0
        --end
    end,
    allow_take = function(inv, listname, index, stack, player)
        --if minetest.setting_getbool("creative_mode")
	--	--or minetest.check_player_privs(player, {creative=true})
	--	then
		if strs:starts(listname,"view_") then
			return stack:get_count()
		end
		return -1
        --else
            --return 0
        --end
    end,
 	
    -- on_* - no return value
    -- Called after the actual action has happened, according to what was allowed.
    on_move = function(inv, from_list, from_index, to_list, to_index, count, player) end,
    on_put = function(inv, listname, index, stack, player)
    	if strs:starts(listname,"view_") then
    		inventory_plus.set_inventory_formspec(player, betterCreativeInventory.get_formspecView(player))
    	end
    end,
    on_take = function(inv, listname, index, stack, player)
    	if strs:starts(listname,"view_") then
    		inventory_plus.set_inventory_formspec(player, betterCreativeInventory.get_formspecView(player))
    	end
    end,
})
-- ///////////