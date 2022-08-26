-- Stone Erodes to Cobble to Dirt to Lava
default.change_to_cobble = function(pos)
	minetest.set_node(pos, {name="default:cobble"})
end

default.change_to_dirt = function(pos)
	minetest.set_node(pos, {name="default:dirt"})
end

default.change_to_lava = function(pos)
	minetest.set_node(pos, {name="default:lava_source"})
end

default.change_to_air = function(pos)
	minetest.set_node(pos, {name="air"})
end

-- Gravel/Glass Erodes to Lava -- This will nuke a desert!

minetest.register_abm({
        nodenames = {"default:gravel", "default:glass"},
        neighbors = {"group:lava"},
        interval = 1,
        chance = 1,
        action = function(pos, node, active_object_count, active_object_count_wider)
                default.change_to_lava(pos, node, active_object_count, active_object_count_wider)
        end,
})

-- Stone erodes to Cobble erodes to Dirt erodes to Flowing Lava

minetest.register_abm({
	nodenames = {"group:stone"},
	neighbors = {"group:lava"},
	interval = 5,
	chance = 4,
	action = function(pos, node, active_object_count, active_object_count_wider)
		default.change_to_cobble(pos, node, active_object_count, active_object_count_wider)
	end,
})

minetest.register_abm({
	nodenames = {"default:cobble"},
	neighbors = {"group:lava"},
	interval = 5,
	chance = 2,
	action = function(pos, node, active_object_count, active_object_count_wider)
		default.change_to_dirt(pos, node, active_object_count, active_object_count_wider)
	end,
})

minetest.register_abm({
	nodenames = {"default:dirt"},
	neighbors = {"group:lava"},
	interval = 5,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		default.change_to_air(pos, node, active_object_count, active_object_count_wider)
	end,
})

-- Sand erodes to Glass erodes to Air

default.change_to_glass = function(pos)
	minetest.set_node(pos, {name="default:glass"})
end

minetest.register_abm({
	nodenames = {"group:sand"},
	neighbors = {"group:lava"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		default.change_to_glass(pos, node, active_object_count, active_object_count_wider)
	end,
})