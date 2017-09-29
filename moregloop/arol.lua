-- Arol
minetest.register_node("moregloop:small_arol", {
	description = "Small Arol Ore",
	inventory_image = minetest.inventorycube("default_stone.png^moregloop_arol_shard.png"),
	tiles = {"default_stone.png^moregloop_arol_shard.png"},
	is_ground_content = true,
	groups = {cracky=1, stone=1, gloop=1},
	drop = {
		max_items = 2,
		items = {
			{ items = {'default:cobble'} },
			{ items = {'moregloop:arol_shard'} }
			}
	} ,
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("moregloop:medium_arol", {
	description = "Medium Arol Ore",
	inventory_image = minetest.inventorycube("default_stone.png^moregloop_arol_crystal.png"),
	tiles = {"default_stone.png^moregloop_arol_crystal.png"},
	is_ground_content = true,
	groups = {cracky=1, stone=1, gloopcrystal=1},
	drop = {
		max_items = 2,
		items = {
			{ items = {'default:cobble'} },
			{ items = {'moregloop:arol_crystal'} }
			}
	} ,
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("moregloop:large_arol", {
	description = "Large Arol Ore",
	inventory_image = minetest.inventorycube("default_stone.png^moregloop_arol_gem.png"),
	tiles = {"default_stone.png^moregloop_arol_gem.png"},
	is_ground_content = true,
	groups = {cracky=1, stone=1, gloopgem=1},
	drop = {
		max_items = 2,
		items = {
			{ items = {'default:cobble'} },
			{ items = {'moregloop:arol_gem'} }
			}
	} ,
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
})

--Oregen
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "moregloop:small_arol",
	wherein        = "default:stone",
	clust_scarcity = 15*15*15,
	clust_num_ores = 8,
	clust_size     = 3,
	height_min     = -50,
	height_max     = 1000,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "moregloop:medium_arol",
	wherein        = "default:stone",
	clust_scarcity = 17*17*17,
	clust_num_ores = 10,
	clust_size     = 5,
	height_min     = -100,
	height_max     = -50,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "moregloop:large_arol",
	wherein        = "default:stone",
	clust_scarcity = 21*21*21,
	clust_num_ores = 10,
	clust_size     = 5,
	height_min     = -31000,
	height_max     = -100,
})

--The Arol CraftItems
minetest.register_craftitem("moregloop:arol_shard", {
	description = "Arol Shard",
	groups = {gloop=1},
	inventory_image = "moregloop_arol_shard.png",
	full_punch_interval = 0.5,
})

minetest.register_craftitem("moregloop:arol_crystal", {
	description = "Arol Crystal",
	inventory_image = "moregloop_arol_crystal.png",
        groups = {gloopcrystal=1},
	full_punch_interval = 0.5,
})

minetest.register_craftitem("moregloop:arol_gem", {
	description = "Arol Gem",
	inventory_image = "moregloop_arol_gem.png",
        groups = {gloopgem=1},
	full_punch_interval = 0.5,
})

--Blocks
minetest.register_node("moregloop:arol_block", {
	description = "Arol Block",
	tiles = {"moregloop_arol_block.png"},
	is_ground_content = true,
	groups = {snappy=1,bendy=1,cracky=2,level=2},
	sounds = default.node_sound_stone_defaults()
})

--Crafts
minetest.register_craft({
	type = "cooking",
	output = "moregloop:arol_crystal",
	recipe = "moregloop:arol_shard",
})

minetest.register_craft({
	type = "cooking",
	output = "moregloop:arol_gem",
	recipe = "moregloop:arol_crystal",
})

minetest.register_craft({
	output = 'moregloop:arol_block 1',
	recipe = {
		{"moregloop:arol_gem","moregloop:arol_gem"},
		{"moregloop:arol_gem","moregloop:arol_gem"},
	}
})

minetest.register_craft({
	output = 'moregloop:arol_shardpick',
	recipe = {
		{'moregloop:arol_shard', 'moregloop:arol_shard', 'moregloop:arol_shard'},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'moregloop:arol_crystalpick',
	recipe = {
		{'moregloop:arol_crystal', 'moregloop:arol_crystal', 'moregloop:arol_crystal'},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'moregloop:arol_gempick',
	recipe = {
		{'moregloop:arol_gem', 'moregloop:arol_gem', 'moregloop:arol_gem'},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

--Picks
minetest.register_tool("moregloop:arol_shardpick", {
	description = "Arol Shard Pickaxe",
	inventory_image = "moregloop_tool_arolpick.png",
	tool_capabilities = {
		full_punch_interval = 0.6,
		max_drop_level=3,
		groupcaps={
			cracky={times={[1]=0.70, [2]=0.55, [3]=0.40}, uses=5, maxlevel=3},
			crumbly={times={[1]=0.85, [2]=0.60, [3]=0.35}, uses=5, maxlevel=3},
			choppy={times={[1]=0.70, [2]=0.55, [3]=0.40}, uses=5, maxlevel=3},
			fleshy={times={[1]=0.70, [2]=0.55, [3]=0.40}, uses=5, maxlevel=3},
			snappy={times={[1]=0.70, [2]=0.55, [3]=0.40}, uses=5, maxlevel=3}
		}
	},
})

minetest.register_tool("moregloop:arol_crystalpick", {
	description = "Arol Crystal Pickaxe",
	inventory_image = "moregloop_tool_arolpick.png",
	tool_capabilities = {
		full_punch_interval = 0.6,
		max_drop_level=3,
		groupcaps={
			cracky={times={[1]=0.70, [2]=0.55, [3]=0.40}, uses=10, maxlevel=3},
			crumbly={times={[1]=0.85, [2]=0.60, [3]=0.35}, uses=10, maxlevel=3},
			choppy={times={[1]=0.70, [2]=0.55, [3]=0.40}, uses=10, maxlevel=3},
			fleshy={times={[1]=0.70, [2]=0.55, [3]=0.40}, uses=10, maxlevel=3},
			snappy={times={[1]=0.70, [2]=0.55, [3]=0.40}, uses=10, maxlevel=3}
		}
	},
})

minetest.register_tool("moregloop:arol_gempick", {
	description = "Arol Gem Pickaxe",
	inventory_image = "moregloop_tool_arolpick.png",
	tool_capabilities = {
		full_punch_interval = 0.6,
		max_drop_level=3,
		groupcaps={
			cracky={times={[1]=0.70, [2]=0.55, [3]=0.40}, uses=20, maxlevel=3},
			crumbly={times={[1]=0.85, [2]=0.60, [3]=0.35}, uses=20, maxlevel=3},
			choppy={times={[1]=0.70, [2]=0.55, [3]=0.40}, uses=20, maxlevel=3},
			fleshy={times={[1]=0.70, [2]=0.55, [3]=0.40}, uses=20, maxlevel=3},
			snappy={times={[1]=0.70, [2]=0.55, [3]=0.40}, uses=20, maxlevel=3}
		}
	},
})
