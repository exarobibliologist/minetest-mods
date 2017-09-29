-- Change to Obsidian Brick
default.change_to_obsidianbrick = function(pos)
	minetest.set_node(pos, {name="default:obsidianbrick"})
end

minetest.register_abm({
	nodenames = {"default:obsidian"},
	neighbors = {"group:lava"},
	interval = 2,
	chance = 1,
	action = function(pos, node, active_object_count, active_object_count_wider)
		default.change_to_obsidianbrick(pos, node, active_object_count, active_object_count_wider)
	end,
})
