-- MoreGloop v0.6.2-5 by cypher-neo
-- License: GPLv3
-- Textures: WTFPL

-- As of version 0.5 moreGloop is seeded throughout the world.

-- Version 0.6 sees the creation of non-smelting Gloop. Mine it and use it, just like Mese, without needing to smelt it into an ingot first!

-- Version 0.6.2 - Each Gloop is broken into 3 nodes of varying size (shards, crystals, and gems).
-- It takes 4 shards to make a crystal, and 4 crystals to make a gem. The additional craftitems will now allow for much more expansion on Gloop.

-- Load files
dofile(minetest.get_modpath("moregloop").."/kalite.lua")
dofile(minetest.get_modpath("moregloop").."/arol.lua")
dofile(minetest.get_modpath("moregloop").."/akalin.lua")
dofile(minetest.get_modpath("moregloop").."/alatro.lua")
dofile(minetest.get_modpath("moregloop").."/talinite.lua")
dofile(minetest.get_modpath("moregloop").."/crafting.lua")