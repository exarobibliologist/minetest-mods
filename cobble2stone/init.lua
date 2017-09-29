-- Change to Stone
default.change_to_stone = function(pos)
	minetest.set_node(pos, {name="default:stone"})
end

minetest.register_abm({
	nodenames = {"default:cobble"},
	neighbors = {"group:lava"},
	interval = 1,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		default.change_to_stone(pos, node, active_object_count, active_object_count_wider)
	end,
})