minetest.register_on_shutdown(function()
	local worldpath = minetest.get_worldpath()
	io.output(worldpath.."/creativinv_playerprefs.txt")
	--print("ok")
--	for name, prefs in pairs(betterCreateiveInventory.players) do
----		local block = name..";"..prefs.set_sort..";"..prefs.set_view..";"
--		--print(name)
--		local block = 'betterCreateiveInventory.players["'..name..'"]={}'
--		print(block)
--		--io.write(block)
--	end
	io.write(minetest.serialize(betterCreativeInventory.players))
end)