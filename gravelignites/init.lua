-- Gravel Changes to Flowing

default.change_to_flowing = function(pos)
	minetest.set_node(pos, {name="default:lava_flowing"})
end

minetest.register_abm({
	nodenames = {"default:gravel"},
        neighbors = {"group:lava"},
        interval = 1,
        chance = 2,
        action = function(pos, node, active_object_count, active_object_count_wider)
                default.change_to_flowing(pos, node, active_object_count, active_object_count_wider)
        end,
})

default.change_to_source = function(pos)
        minetest.set_node(pos, {name="default:lava_source"})
end

minetest.register_abm({
        nodenames = {"default:gravel"},
        neighbors = {"group:lava"},
        interval = 1,
        chance = 2,
        action = function(pos, node, active_object_count, active_object_count_wider)
                default.change_to_source(pos, node, active_object_count, active_object_count_wider)
        end,
})
