-- Talinite
minetest.register_node("moregloop:small_talinite", {
	description = "Small Talinite Ore",
	inventory_image = minetest.inventorycube("default_stone.png^moregloop_talinite_shard.png"),
	tiles = {"default_stone.png^moregloop_talinite_shard.png"},
	is_ground_content = true,
	light_source = 3,
	groups = {cracky=1, stone=1, gloop=1},
	drop = {
		max_items = 2,
		items = {
			{ items = {'default:cobble'} },
			{ items = {'moregloop:talinite_shard'} }
			}
	} ,
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("moregloop:medium_talinite", {
	description = "Medium Talinite Ore",
	inventory_image = minetest.inventorycube("default_stone.png^moregloop_talinite_crystal.png"),
	tiles = {"default_stone.png^moregloop_talinite_crystal.png"},
	is_ground_content = true,
	light_source = 5,
	groups = {cracky=1, stone=1, gloopcrystal=1},
	drop = {
		max_items = 2,
		items = {
			{ items = {'default:cobble'} },
			{ items = {'moregloop:talinite_crystal'} }
			}
	} ,
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("moregloop:large_talinite", {
	description = "Large Talinite Ore",
	inventory_image = minetest.inventorycube("default_stone.png^moregloop_talinite_gem.png"),
	tiles = {"default_stone.png^moregloop_talinite_gem.png"},
	is_ground_content = true,
	light_source = 10,
	groups = {cracky=1, stone=1, gloopgem=1},
	drop = {
		max_items = 2,
		items = {
			{ items = {'default:cobble'} },
			{ items = {'moregloop:talinite_gem'} }
			}
	} ,
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
})

--Oregen
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "moregloop:small_talinite",
	wherein        = "default:stone",
	clust_scarcity = 15*15*15,
	clust_num_ores = 8,
	clust_size     = 3,
	height_min     = -50,
	height_max     = 1000,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "moregloop:medium_talinite",
	wherein        = "default:stone",
	clust_scarcity = 17*17*17,
	clust_num_ores = 10,
	clust_size     = 5,
	height_min     = -100,
	height_max     = -50,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "moregloop:large_talinite",
	wherein        = "default:stone",
	clust_scarcity = 21*21*21,
	clust_num_ores = 10,
	clust_size     = 5,
	height_min     = -31000,
	height_max     = -100,
})

--The Talinite CraftItems
minetest.register_craftitem("moregloop:talinite_shard", {
	description = "Talinite Shard",
	groups = {gloop=1},
	inventory_image = "moregloop_talinite_shard.png",
	full_punch_interval = 0.5,
})

minetest.register_craftitem("moregloop:talinite_crystal", {
	description = "Talinite Crystal",
	inventory_image = "moregloop_talinite_crystal.png",
        groups = {gloopcrystal=1},
	full_punch_interval = 0.5,
})

minetest.register_craftitem("moregloop:talinite_gem", {
	description = "Talinite Gem",
	inventory_image = "moregloop_talinite_gem.png",
        groups = {gloopgem=1},
	full_punch_interval = 0.5,
})

--Blocks
minetest.register_node("moregloop:talinite_block", {
	description = 'Talinite Block',
	tiles = {"moregloop_talinite_block.png"},
	is_ground_content = true,
	light_source = LIGHT_MAX,
	groups = {snappy=1,bendy=2,cracky=1,melty=2,level=2},
	sounds = default.node_sound_stone_defaults()
})

--Crafts
minetest.register_craft({
	type = "cooking",
	output = "moregloop:talinite_crystal",
	recipe = "moregloop:talinite_shard",
})

minetest.register_craft({
	type = "cooking",
	output = "moregloop:talinite_gem",
	recipe = "moregloop:talinite_crystal",
})

minetest.register_craft( {
	output = 'moregloop:talinite_block 1',
	recipe = {
		{"moregloop:talinite_gem","moregloop:talinite_gem"},
		{"moregloop:talinite_gem","moregloop:talinite_gem"},
	}
})