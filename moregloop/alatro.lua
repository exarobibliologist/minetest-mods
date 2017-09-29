-- Alatro
minetest.register_node("moregloop:small_alatro", {
	description = "Small Alatro Ore",
	inventory_image = minetest.inventorycube("default_stone.png^moregloop_alatro_shard.png"),
	tiles = {"default_stone.png^moregloop_alatro_shard.png"},
	is_ground_content = true,
	groups = {cracky=1, stone=1, gloop=1},
	drop = {
		max_items = 2,
		items = {
			{ items = {'default:cobble'} },
			{ items = {'moregloop:alatro_shard'} }
			}
	} ,
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("moregloop:medium_alatro", {
	description = "Medium Alatro Ore",
	inventory_image = minetest.inventorycube("default_stone.png^moregloop_alatro_crystal.png"),
	tiles = {"default_stone.png^moregloop_alatro_crystal.png"},
	is_ground_content = true,
	groups = {cracky=1, stone=1, gloopcrystal=1},
	drop = {
		max_items = 2,
		items = {
			{ items = {'default:cobble'} },
			{ items = {'moregloop:alatro_crystal'} }
			}
	} ,
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("moregloop:large_alatro", {
	description = "Large Alatro Ore",
	inventory_image = minetest.inventorycube("default_stone.png^moregloop_alatro_gem.png"),
	tiles = {"default_stone.png^moregloop_alatro_gem.png"},
	is_ground_content = true,
	groups = {cracky=1, stone=1, gloopgem=1},
	drop = {
		max_items = 2,
		items = {
			{ items = {'default:cobble'} },
			{ items = {'moregloop:alatro_gem'} }
			}
	} ,
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
})

--Oregen
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "moregloop:small_alatro",
	wherein        = "default:stone",
	clust_scarcity = 15*15*15,
	clust_num_ores = 8,
	clust_size     = 3,
	height_min     = -50,
	height_max     = 1000,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "moregloop:medium_alatro",
	wherein        = "default:stone",
	clust_scarcity = 17*17*17,
	clust_num_ores = 10,
	clust_size     = 5,
	height_min     = -100,
	height_max     = -50,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "moregloop:large_alatro",
	wherein        = "default:stone",
	clust_scarcity = 21*21*21,
	clust_num_ores = 10,
	clust_size     = 5,
	height_min     = -31000,
	height_max     = -100,
})

--The Alatro CraftItems
minetest.register_craftitem("moregloop:alatro_shard", {
	description = "Alatro Shard",
	groups = {gloop=1},
	inventory_image = "moregloop_alatro_shard.png",
	full_punch_interval = 0.5,
})

minetest.register_craftitem("moregloop:alatro_crystal", {
	description = "Alatro Crystal",
	inventory_image = "moregloop_alatro_crystal.png",
        groups = {gloopcrystal=1},
	full_punch_interval = 0.5,
})

minetest.register_craftitem("moregloop:alatro_gem", {
        description = "Alatro Gem",	
        inventory_image = "moregloop_alatro_gem.png",
        groups = {gloopgem=1},
	full_punch_interval = 0.5,
})

--Blocks
minetest.register_node("moregloop:alatro_block", {
	description = "Alatro Block",
	tiles = {"moregloop_alatro_block.png"},
	is_ground_content = true,
	groups = {snappy=1,bendy=1,cracky=2,level=2},
	sounds = default.node_sound_stone_defaults()
})

--Crafting
minetest.register_craft({
	type = "cooking",
	output = "moregloop:alatro_crystal",
	recipe = "moregloop:alatro_shard",
})

minetest.register_craft({
	type = "cooking",
	output = "moregloop:alatro_gem",
	recipe = "moregloop:alatro_crystal",
})

minetest.register_craft( {
	output = 'moregloop:alatro_block 1',
	recipe = {
		{"moregloop:alatro_gem","moregloop:alatro_gem"},
		{"moregloop:alatro_gem","moregloop:alatro_gem"},
	}
})

minetest.register_craft({
	output = 'moregloop:alatro_shardpick',
	recipe = {
		{'moregloop:alatro_shard', 'moregloop:alatro_shard', 'moregloop:alatro_shard'},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'moregloop:alatro_crystalpick',
	recipe = {
		{'moregloop:alatro_crystal', 'moregloop:alatro_crystal', 'moregloop:alatro_crystal'},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'moregloop:alatro_gempick',
	recipe = {
		{'moregloop:alatro_gem', 'moregloop:alatro_gem', 'moregloop:alatro_gem'},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

--Picks
minetest.register_tool("moregloop:alatro_shardpick", {
	description = "Alatro Shard Pickaxe",
	inventory_image = "moregloop_tool_alatropick.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			cracky={times={[1]=0.80, [2]=0.60, [3]=0.40}, uses=5, maxlevel=3},
			crumbly={times={[1]=0.95, [2]=0.65, [3]=0.35}, uses=5, maxlevel=3},
			choppy={times={[1]=0.80, [2]=0.60, [3]=0.40}, uses=5, maxlevel=3},
			fleshy={times={[1]=0.80, [2]=0.60, [3]=0.40}, uses=5, maxlevel=3},
			snappy={times={[1]=0.80, [2]=0.60, [3]=0.40}, uses=5, maxlevel=3}
		}
	},
})

minetest.register_tool("moregloop:alatro_crystalpick", {
	description = "Alatro Crystal Pickaxe",
	inventory_image = "moregloop_tool_alatropick.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			cracky={times={[1]=0.80, [2]=0.60, [3]=0.40}, uses=10, maxlevel=3},
			crumbly={times={[1]=0.95, [2]=0.65, [3]=0.35}, uses=10, maxlevel=3},
			choppy={times={[1]=0.80, [2]=0.60, [3]=0.40}, uses=10, maxlevel=3},
			fleshy={times={[1]=0.80, [2]=0.60, [3]=0.40}, uses=10, maxlevel=3},
			snappy={times={[1]=0.80, [2]=0.60, [3]=0.40}, uses=10, maxlevel=3}
		}
	},
})

minetest.register_tool("moregloop:alatro_gempick", {
	description = "Alatro Gem Pickaxe",
	inventory_image = "moregloop_tool_alatropick.png",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			cracky={times={[1]=0.80, [2]=0.60, [3]=0.40}, uses=20, maxlevel=3},
			crumbly={times={[1]=0.95, [2]=0.65, [3]=0.35}, uses=20, maxlevel=3},
			choppy={times={[1]=0.80, [2]=0.60, [3]=0.40}, uses=20, maxlevel=3},
			fleshy={times={[1]=0.80, [2]=0.60, [3]=0.40}, uses=20, maxlevel=3},
			snappy={times={[1]=0.80, [2]=0.60, [3]=0.40}, uses=20, maxlevel=3}
		}
	},
})
