betterCreativeInventory.loadSettingsFromFile = function()
	local worldpath = minetest.get_worldpath()
	local buffer = ""
	
	if io.open(worldpath.."/creativeinv_playerprefs.txt","r") ~= nil then
		io.input(worldpath.."/creativeinv_playerprefs.txt")
	
		local size = 2^13      -- good buffer size (8K)
		while true do
			local block = io.read(size)
			if not block then break end
			buffer = buffer .. block
		end
		
		local table = minetest.deserialize(buffer)
		if table~=nil then
			betterCreativeInventory.ldplayers = table
		end
--		local lines = buffer:split(";")
--		for i=0,#lines/3 do
--			local base = (i*3)+1
--			--print(base)
--			if lines[base]~="" then
--				--print(lines[base])
----				betterCreativeInventory.players[lines[base]] = {
----					set_sort = lines[base+1],
----					set_view = lines[base+2],
----				}
--			end
--		end
	end
end