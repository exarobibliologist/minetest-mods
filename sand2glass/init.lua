-- Sand Changes to Glass

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
