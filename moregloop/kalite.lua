-- Kalite (Makes a Red Torch and Heals)
minetest.register_node("moregloop:small_kalite", {
	description = "Small Kalite Ore",
	inventory_image = minetest.inventorycube("default_stone.png^moregloop_kalite_shard.png"),
	tiles = {"default_stone.png^moregloop_kalite_shard.png"},
	is_ground_content = true,
	groups = {cracky=3, gloop=1},
	drop = {
		max_items = 2,
		items = {
			{ items = {'default:cobble'} },
			{ items = {'moregloop:kalite_shard'} }
			}
	} ,
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("moregloop:medium_kalite", {
	description = "Medium Kalite Ore",
	inventory_image = minetest.inventorycube("default_stone.png^moregloop_kalite_crystal.png"),
	tiles = {"default_stone.png^moregloop_kalite_crystal.png"},
	is_ground_content = true,
	groups = {cracky=2, gloopcrystal=1},
	drop = {
		max_items = 2,
		items = {
			{ items = {'default:cobble'} },
			{ items = {'moregloop:kalite_crystal'} }
			}
	} ,
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_node("moregloop:large_kalite", {
	description = "Large Kalite Ore",
	inventory_image = minetest.inventorycube("default_stone.png^moregloop_kalite_gem.png"),
	tiles = {"default_stone.png^moregloop_kalite_gem.png"},
	is_ground_content = true,
	groups = {cracky=1, gloopgem=1},
	drop = {
		max_items = 2,
		items = {
			{ items = {'default:cobble'} },
			{ items = {'moregloop:kalite_gem'} }
			}
	} ,
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
})

--Oregen
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "moregloop:small_kalite",
	wherein        = "default:stone",
	clust_scarcity = 12*12*12,
	clust_num_ores = 8,
	clust_size     = 3,
	height_min     = -50,
	height_max     = 1000,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "moregloop:medium_kalite",
	wherein        = "default:stone",
	clust_scarcity = 15*15*15,
	clust_num_ores = 10,
	clust_size     = 5,
	height_min     = -100,
	height_max     = -50,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "moregloop:large_kalite",
	wherein        = "default:stone",
	clust_scarcity = 20*20*20,
	clust_num_ores = 10,
	clust_size     = 5,
	height_min     = -31000,
	height_max     = -100,
})

--The Kalite CraftItems
minetest.register_craftitem("moregloop:kalite_shard", {
	description = "Kalite Shard",
	inventory_image = "moregloop_kalite_shard.png",
	groups = {gloop=1},
	on_use = minetest.item_eat(5),
})

minetest.register_craftitem("moregloop:kalite_crystal", {
	description = "Kalite Crystal",
	inventory_image = "moregloop_kalite_crystal.png",
        groups = {gloopcrystal=1},
	on_use = minetest.item_eat(10),
})

minetest.register_craftitem("moregloop:kalite_gem", {
	description = "Kalite Gem",
	inventory_image = "moregloop_kalite_gem.png",
        groups = {gloopgem=1},
	on_use = minetest.item_eat(50),
})

--Recipes
minetest.register_craft({
	type = "cooking",
	output = "moregloop:kalite_crystal",
	recipe = "moregloop:kalite_shard",
})

minetest.register_craft({
	type = "cooking",
	output = "moregloop:kalite_gem",
	recipe = "moregloop:kalite_crystal",
})

minetest.register_craft({
	output = 'moregloop:kalite_torch 1',
	recipe = {
		{'moregloop:kalite_shard'},
		{'default:stick'},
	}
})

--Torches
minetest.register_node("moregloop:kalite_torch", {
	description = "Kalite Torch",
	drawtype = "torchlike",
	--tiles = {"moregloop_kalite_torch_on_floor.png", "moregloop_kalite_torch_on_ceiling.png", "moregloop_kalite_torch.png"},
	tiles = {
		{name="moregloop_kalite_torch_on_floor_animated.png", animation={type="vertical_frames", aspect_w=32, aspect_h=32, length=2.0}},
		{name="moregloop_kalite_torch_on_ceiling_animated.png", animation={type="vertical_frames", aspect_w=32, aspect_h=32, length=2.0}},
		{name="moregloop_kalite_torch_animated.png", animation={type="vertical_frames", aspect_w=32, aspect_h=32, length=2.0}}
	},
	inventory_image = "moregloop_kalite_torch_on_floor.png",
	wield_image = "moregloop_kalite_torch_on_floor.png",
	full_punch_interval = 0.8,
	paramtype = "light",
	paramtype2 = "wallmounted",
	sunlight_propagates = true,
	walkable = false,
	light_source = LIGHT_MAX,
	selection_box = {
		type = "wallmounted",
		wall_top = {-0.1, 0.5-0.6, -0.1, 0.1, 0.5, 0.1},
		wall_bottom = {-0.1, -0.5, -0.1, 0.1, -0.5+0.6, 0.1},
		wall_side = {-0.5, -0.3, -0.1, -0.5+0.3, 0.3, 0.1},
	},
	groups = {choppy=2,dig_immediate=3,flammable=1,lava=3,hot=3,igniter=3},
	legacy_wallmounted = true,
	sounds = default.node_sound_defaults(),
})

--Crafts
minetest.register_craft({
	output = 'moregloop:kalite_torch 4',
	recipe = {
		{'moregloop:kalite_gem'},
		{'default:stick'},
	}
})

minetest.register_craft({
	output = 'moregloop:kalite_torch 16',
	recipe = {
		{'moregloop:kalite_crystal'},
		{'default:stick'},
	}
})

minetest.register_craft({
	output = 'default:torch 20',
	recipe = {
		{'moregloop:kalite_torch'},
	}
})

-- Fuel
minetest.register_craft({
	type = "fuel",
	recipe = "moregloop:kalite_gem",
	burntime = 400,
})

minetest.register_craft({
	type = "fuel",
	recipe = "moregloop:kalite_crystal",
	burntime = 200,
})

minetest.register_craft({
	type = "fuel",
	recipe = "moregloop:kalite_shard",
	burntime = 66,
})
