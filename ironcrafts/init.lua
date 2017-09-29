--Crafts
minetest.register_node("ironcrafts:ironrock", {
	description = "Iron Stone",
	inventory_image = minetest.inventorycube("default_stone.png^default_mineral_iron.png^default_glass.png"),
	tiles = {"default_stone.png^default_mineral_iron.png^default_glass.png"},
	is_ground_content = true,
        light_source = LIGHT_MAX,
	groups = {oddly_breakable_by_hand=3},
	legacy_mineral = true,
	sounds = default.node_sound_stone_defaults(),
})

minetest.register_craft({
	output = 'ironcrafts:ironrock 4',
	recipe = {
		{'group:stone', 'default:iron_lump', 'group:stone'},
		{'default:iron_lump', 'group:stone', 'default:iron_lump'},
		{'group:stone', 'default:iron_lump', 'group:stone'},
	}
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "ironcrafts:ironrock",
	wherein        = "default:stone",
	clust_scarcity = 20*20*20,
	clust_num_ores = 1,
	clust_size     = 5,
	height_min     = -28000,
	height_max     = 1000,
})

default.change_to_ironnode = function(pos)
	minetest.set_node(pos, {name="default:stone_with_iron"})
end

minetest.register_abm({
	nodenames = {"group:cracky"},
        neighbors = {"ironcrafts:ironrock"},
        interval = 2,
        chance = 1,
        action = function(pos, node, active_object_count, active_object_count_wider)
                default.change_to_ironnode(pos, node, active_object_count, active_object_count_wider)
        end,
})

minetest.register_abm({
	nodenames = {"group:choppy"},
        neighbors = {"ironcrafts:ironrock"},
        interval = 2,
        chance = 1,
        action = function(pos, node, active_object_count, active_object_count_wider)
                default.change_to_ironnode(pos, node, active_object_count, active_object_count_wider)
        end,
})

minetest.register_abm({
	nodenames = {"group:snappy"},
        neighbors = {"ironcrafts:ironrock"},
        interval = 2,
        chance = 1,
        action = function(pos, node, active_object_count, active_object_count_wider)
                default.change_to_ironnode(pos, node, active_object_count, active_object_count_wider)
        end,
})

minetest.register_abm({
	nodenames = {"group:crumbly"},
        neighbors = {"ironcrafts:ironrock"},
        interval = 2,
        chance = 1,
        action = function(pos, node, active_object_count, active_object_count_wider)
                default.change_to_ironnode(pos, node, active_object_count, active_object_count_wider)
        end,
})