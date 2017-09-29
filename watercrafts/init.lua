--Crafts
minetest.register_node("watercrafts:waterrock", {
	description = "Water Stone",
	inventory_image = minetest.inventorycube("default_water.png^default_glass.png"),
	tiles = {"default_water.png^default_glass.png"},
	is_ground_content = true,
        light_source = LIGHT_MAX,
	groups = {oddly_breakable_by_hand=3},
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = 'watercrafts:lavarock 4',
	recipe = {
		{'group:stone', 'group:water', 'group:stone'},
		{'group:water', 'group:stone', 'group:water'},
		{'group:stone', 'group:water', 'group:stone'},
	}
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "watercrafts:waterrock",
	wherein        = "default:stone",
	clust_scarcity = 40*40*40,
	clust_num_ores = 1,
	clust_size     = 5,
	height_min     = -28000,
	height_max     = 1000,
})

default.change_to_waternode = function(pos)
	minetest.set_node(pos, {name="default:water_source"})
end

minetest.register_abm({
	nodenames = {"group:cracky"},
        neighbors = {"watercrafts:waterrock"},
        interval = 2,
        chance = 1,
        action = function(pos, node, active_object_count, active_object_count_wider)
                default.change_to_waternode(pos, node, active_object_count, active_object_count_wider)
        end,
})

minetest.register_abm({
	nodenames = {"group:choppy"},
        neighbors = {"watercrafts:waterrock"},
        interval = 2,
        chance = 1,
        action = function(pos, node, active_object_count, active_object_count_wider)
                default.change_to_waternode(pos, node, active_object_count, active_object_count_wider)
        end,
})

minetest.register_abm({
	nodenames = {"group:snappy"},
        neighbors = {"watercrafts:waterrock"},
        interval = 2,
        chance = 1,
        action = function(pos, node, active_object_count, active_object_count_wider)
                default.change_to_waternode(pos, node, active_object_count, active_object_count_wider)
        end,
})

minetest.register_abm({
	nodenames = {"group:crumbly"},
        neighbors = {"watercrafts:waterrock"},
        interval = 2,
        chance = 1,
        action = function(pos, node, active_object_count, active_object_count_wider)
                default.change_to_waternode(pos, node, active_object_count, active_object_count_wider)
        end,
})