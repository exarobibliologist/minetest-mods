--Crafts
minetest.register_node("lavacrafts:lavarock", {
	description = "Lava Stone",
	inventory_image = minetest.inventorycube("default_lava.png^default_glass.png"),
	tiles = {"default_lava.png^default_glass.png"},
	is_ground_content = true,
        light_source = LIGHT_MAX,
	groups = {oddly_breakable_by_hand=3, igniter=1},
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = 'lavacrafts:lavarock 4',
	recipe = {
		{'group:stone', 'group:lava', 'group:stone'},
		{'group:lava', 'group:stone', 'group:lava'},
		{'group:stone', 'group:lava', 'group:stone'},
	}
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "lavacrafts:lavarock",
	wherein        = "default:stone",
	clust_scarcity = 20*20*20,
	clust_num_ores = 1,
	clust_size     = 5,
	height_min     = 1,
	height_max     = 1000,
})

default.change_to_lavanode = function(pos)
	minetest.set_node(pos, {name="default:lava_source"})
end

minetest.register_abm({
	nodenames = {"group:cracky"},
        neighbors = {"lavacrafts:lavarock"},
        interval = 2,
        chance = 1,
        action = function(pos, node, active_object_count, active_object_count_wider)
                default.change_to_lavanode(pos, node, active_object_count, active_object_count_wider)
        end,
})

minetest.register_abm({
	nodenames = {"group:choppy"},
        neighbors = {"lavacrafts:lavarock"},
        interval = 2,
        chance = 1,
        action = function(pos, node, active_object_count, active_object_count_wider)
                default.change_to_lavanode(pos, node, active_object_count, active_object_count_wider)
        end,
})

minetest.register_abm({
	nodenames = {"group:snappy"},
        neighbors = {"lavacrafts:lavarock"},
        interval = 2,
        chance = 1,
        action = function(pos, node, active_object_count, active_object_count_wider)
                default.change_to_lavanode(pos, node, active_object_count, active_object_count_wider)
        end,
})

minetest.register_abm({
	nodenames = {"group:crumbly"},
        neighbors = {"lavacrafts:lavarock"},
        interval = 2,
        chance = 1,
        action = function(pos, node, active_object_count, active_object_count_wider)
                default.change_to_lavanode(pos, node, active_object_count, active_object_count_wider)
        end,
})

default.change_to_liquid = function(pos)
	minetest.set_node(pos, {name="default:water_flowing"})
end

minetest.register_abm({
	nodenames = {"default:ice"},
        neighbors = {"group:lava"},
        interval = 1,
        chance = 1,
        action = function(pos, node, active_object_count, active_object_count_wider)
                default.change_to_liquid(pos, node, active_object_count, active_object_count_wider)
        end,
})