default.change_to_obsidian = function(pos)
        minetest.set_node(pos, {name="default:obsidian"})
end

minetest.register_abm({
        nodenames = {"group:stone"},
        neighbors = {"group:lava"},
        interval = 2,
        chance = 1,
        action = function(pos, node, active_object_count, active_object_count_wider)
                default.change_to_obsidian(pos, node, active_object_count, active_object_count_wider)
        end,
})
