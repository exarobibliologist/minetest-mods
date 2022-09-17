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

default.change_to_lavanode = function(pos)
	minetest.set_node(pos, {name="default:lava_source"})
end

minetest.register_abm({
	nodenames = {"group:stone", "group:sand", "group:wood"},
        neighbors = {"lavacrafts:lavarock"},
        interval = 1,
        chance = 1,
        action = function(pos, node, active_object_count, active_object_count_wider)
                default.change_to_lavanode(pos, node, active_object_count, active_object_count_wider)
        end,
})