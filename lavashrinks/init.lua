default.change_to_flowing = function(pos)
	minetest.set_node(pos, {name="default:lava_flowing"})
end

minetest.register_abm({
	nodenames = {"default:lava_source"},
        neighbors = {"group:lava"},
        interval = 10,
        chance = 2,
        action = function(pos, node, active_object_count, active_object_count_wider)
                default.change_to_flowing(pos, node, active_object_count, active_object_count_wider)
        end,
})
