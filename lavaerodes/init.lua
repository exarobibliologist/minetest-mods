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

default.change_to_flowing = function(pos)
	minetest.set_node(pos, {name="default:lava_flowing"})
end

minetest.register_abm({
	nodenames = {"group:stone"},
	neighbors = {"group:lava"},
	interval = 10,
	chance = 4,
	action = function(pos, node, active_object_count, active_object_count_wider)
		default.change_to_cobble(pos, node, active_object_count, active_object_count_wider)
	end,
})

minetest.register_abm({
	nodenames = {"default:cobble"},
	neighbors = {"group:lava"},
	interval = 10,
	chance = 2,
	action = function(pos, node, active_object_count, active_object_count_wider)
		default.change_to_dirt(pos, node, active_object_count, active_object_count_wider)
	end,
})

minetest.register_abm({
	nodenames = {"default:dirt"},
	neighbors = {"group:lava"},
	interval = 10,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		default.change_to_flowing(pos, node, active_object_count, active_object_count_wider)
	end,
})

-- Sand Erodes to Glass to Air

default.change_to_glass = function(pos)
	minetest.set_node(pos, {name="default:glass"})
end

minetest.register_abm({
	nodenames = {"group:sand"},
	neighbors = {"group:lava"},
	interval = 10,
	chance = 4,
	action = function(pos, node, active_object_count, active_object_count_wider)
		default.change_to_glass(pos, node, active_object_count, active_object_count_wider)
	end,
})

minetest.register_abm({
	nodenames = {"default:glass"},
	neighbors = {"group:lava"},
	interval = 10,
	chance = 8,
	action = function(pos, node, active_object_count, active_object_count_wider)
		default.change_to_flowing(pos, node, active_object_count, active_object_count_wider)
	end,
})

-- Water Changes to Obsidian

default.change_to_obsidian = function(pos)
	minetest.set_node(pos, {name="default:obsidian"})
end

minetest.register_abm({
	nodenames = {"group:water"},
	neighbors = {"group:lava"},
	interval = 10,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		default.change_to_obsidian(pos, node, active_object_count, active_object_count_wider)
	end,
})