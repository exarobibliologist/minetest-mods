-- Akalin
minetest.register_node("moregloop:small_akalin", {
	description = "Small Akalin Ore",
	inventory_image = minetest.inventorycube("default_stone.png^moregloop_akalin_shard.png"),
	tiles = {"default_stone.png^moregloop_akalin_shard.png"},
	is_ground_content = true,
	groups = {cracky=1, gloop=1},
	drop = {
		max_items = 2,
		items = {
			{ items = {'default:cobble'} },
			{ items = {'moregloop:akalin_shard'} }
			}
	} ,
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("moregloop:medium_akalin", {
	description = "Medium Akalin Ore",
	inventory_image = minetest.inventorycube("default_stone.png^moregloop_akalin_crystal.png"),
	tiles = {"default_stone.png^moregloop_akalin_crystal.png"},
	is_ground_content = true,
	groups = {cracky=1, gloopcrystal=1},
	drop = {
		max_items = 2,
		items = {
			{ items = {'default:cobble'} },
			{ items = {'moregloop:akalin_crystal'} }
			}
	} ,
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("moregloop:large_akalin", {
	description = "Large Akalin Ore",
	inventory_image = minetest.inventorycube("default_stone.png^moregloop_akalin_gem.png"),
	tiles = {"default_stone.png^moregloop_akalin_gem.png"},
	is_ground_content = true,
	groups = {cracky=1, gloopgem=1},
	drop = {
		max_items = 2,
		items = {
			{ items = {'default:cobble'} },
			{ items = {'moregloop:akalin_gem'} }
			}
	} ,
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
})

--Oregen
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "moregloop:small_akalin",
	wherein        = "default:stone",
	clust_scarcity = 15*15*15,
	clust_num_ores = 8,
	clust_size     = 3,
	height_min     = -50,
	height_max     = 1000,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "moregloop:medium_akalin",
	wherein        = "default:stone",
	clust_scarcity = 17*17*17,
	clust_num_ores = 10,
	clust_size     = 5,
	height_min     = -100,
	height_max     = -50,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "moregloop:large_akalin",
	wherein        = "default:stone",
	clust_scarcity = 21*21*21,
	clust_num_ores = 10,
	clust_size     = 5,
	height_min     = -31000,
	height_max     = -100,
})

--The Akalin CraftItems
minetest.register_craftitem("moregloop:akalin_shard", {
	description = "Akalin Shard",
	groups = {gloop=1},
	inventory_image = "moregloop_akalin_shard.png",
	full_punch_interval = 0.5,
})

minetest.register_craftitem("moregloop:akalin_crystal", {
	description = "Akalin Crystal",
	inventory_image = "moregloop_akalin_crystal.png",
        groups = {gloopcrystal=1},
	full_punch_interval = 0.5,
})

minetest.register_craftitem("moregloop:akalin_gem", {
	description = "Akalin Gem",
	inventory_image = "moregloop_akalin_gem.png",
        groups = {gloopgem=1},
	full_punch_interval = 0.5,
})

--Blocks
minetest.register_node("moregloop:akalin_block", {
	description = "Akalin Block",
	tiles = {"moregloop_akalin_block.png"},
	is_ground_content = true,
	groups = {snappy=1,bendy=2,cracky=3,level=2},
	sounds = default.node_sound_stone_defaults()
})

--Crafts
minetest.register_craft({
	type = "cooking",
	output = "moregloop:akalin_crystal",
	recipe = "moregloop:akalin_shard",
})

minetest.register_craft({
	type = "cooking",
	output = "moregloop:akalin_gem",
	recipe = "moregloop:akalin_crystal",
})

minetest.register_craft( {
	output = 'moregloop:akalin_block 1',
	recipe = {
		{"moregloop:akalin_gem","moregloop:akalin_gem"},
		{"moregloop:akalin_gem","moregloop:akalin_gem"},
	}
})

minetest.register_craft({
	output = 'moregloop:akalin_shardpick',
	recipe = {
		{'moregloop:akalin_shard', 'moregloop:akalin_shard', 'moregloop:akalin_shard'},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'moregloop:akalin_crystalpick',
	recipe = {
		{'moregloop:akalin_crystal', 'moregloop:akalin_crystal', 'moregloop:akalin_crystal'},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'moregloop:akalin_gempick',
	recipe = {
		{'moregloop:akalin_gem', 'moregloop:akalin_gem', 'moregloop:akalin_gem'},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

--Picks
minetest.register_tool("moregloop:akalin_shardpick", {
	description = "Akalin Shard Pickaxe",
	inventory_image = "moregloop_tool_akalinpick.png",
	tool_capabilities = {
		full_punch_interval = 0.4,
		max_drop_level=3,
		groupcaps={
			cracky={times={[1]=0.60, [2]=0.50, [3]=0.40}, uses=5, maxlevel=3},
			crumbly={times={[1]=0.75, [2]=0.55, [3]=0.35}, uses=5, maxlevel=3},
			choppy={times={[1]=0.60, [2]=0.50, [3]=0.40}, uses=5, maxlevel=3},
			fleshy={times={[1]=0.60, [2]=0.50, [3]=0.40}, uses=5, maxlevel=3},
			snappy={times={[1]=0.60, [2]=0.50, [3]=0.40}, uses=5, maxlevel=3}
		}
	},
})

minetest.register_tool("moregloop:akalin_crystalpick", {
	description = "Akalin Crystal Pickaxe",
	inventory_image = "moregloop_tool_akalinpick.png",
	tool_capabilities = {
		full_punch_interval = 0.4,
		max_drop_level=3,
		groupcaps={
			cracky={times={[1]=0.60, [2]=0.50, [3]=0.40}, uses=10, maxlevel=3},
			crumbly={times={[1]=0.75, [2]=0.55, [3]=0.35}, uses=10, maxlevel=3},
			choppy={times={[1]=0.60, [2]=0.50, [3]=0.40}, uses=10, maxlevel=3},
			fleshy={times={[1]=0.60, [2]=0.50, [3]=0.40}, uses=10, maxlevel=3},
			snappy={times={[1]=0.60, [2]=0.50, [3]=0.40}, uses=10, maxlevel=3}
		}
	},
})

minetest.register_tool("moregloop:akalin_gempick", {
	description = "Akalin Gem Pickaxe",
	inventory_image = "moregloop_tool_akalinpick.png",
	tool_capabilities = {
		full_punch_interval = 0.4,
		max_drop_level=3,
		groupcaps={
			cracky={times={[1]=0.60, [2]=0.50, [3]=0.40}, uses=20, maxlevel=3},
			crumbly={times={[1]=0.75, [2]=0.55, [3]=0.35}, uses=20, maxlevel=3},
			choppy={times={[1]=0.60, [2]=0.50, [3]=0.40}, uses=20, maxlevel=3},
			fleshy={times={[1]=0.60, [2]=0.50, [3]=0.40}, uses=20, maxlevel=3},
			snappy={times={[1]=0.60, [2]=0.50, [3]=0.40}, uses=20, maxlevel=3}
		}
	},
})
