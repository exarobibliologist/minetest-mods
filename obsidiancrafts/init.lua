--Crafts
minetest.register_tool("obsidiancrafts:pick_obsidian", {
        description = "Obsidian Pickaxe",
        inventory_image = "tool_obsidianpick.png",
        tool_capabilities = {
                full_punch_interval = 0.9,
                max_drop_level=3,
                groupcaps={
                        crumbly={times={[1]=0.75, [2]=0.55, [3]=0.35}, uses=75, maxlevel=3},
                        cracky = {times={[1]=0.8, [2]=0.6, [3]=0.4}, uses=75, maxlevel=3},
                        fleshy = {times={[1]=0.8, [2]=0.6, [3]=0.4}, uses=75, maxlevel=3},
                        snappy = {times={[1]=0.8, [2]=0.6, [3]=0.4}, uses=75, maxlevel=3},
                        choppy = {times={[1]=0.8, [2]=0.6, [3]=0.4}, uses=75, maxlevel=3},

                },
        },
})

minetest.register_tool("obsidiancrafts:pick_blockobsidian", {
        description = "Obsidian Block Pickaxe",
        inventory_image = "tool_obsidianpick.png",
        tool_capabilities = {
                full_punch_interval = 0.9,
                max_drop_level=3,
                groupcaps={
                        crumbly={times={[1]=0.65, [2]=0.45, [3]=0.25}, uses=150, maxlevel=3},
                        cracky = {times={[1]=0.7, [2]=0.5, [3]=0.3}, uses=150, maxlevel=3},
                        fleshy = {times={[1]=0.7, [2]=0.5, [3]=0.3}, uses=150, maxlevel=3},
                        snappy = {times={[1]=0.7, [2]=0.5, [3]=0.3}, uses=150, maxlevel=3},
                        choppy = {times={[1]=0.7, [2]=0.5, [3]=0.3}, uses=150, maxlevel=3},

                },
        },
})

minetest.register_craft({
	output = 'obsidiancrafts:pick_obsidian',
	recipe = {
		{'default:obsidian', 'default:obsidian', 'default:obsidian'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
	output = 'obsidiancrafts:pick_blockobsidian',
	recipe = {
		{'default:obsidianbrick', 'default:obsidianbrick', 'default:obsidianbrick'},
		{'', 'group:stick', ''},
		{'', 'group:stick', ''},
	}
})

minetest.register_craft({
        output = 'default:torch 50',
        recipe = {
                {'default:lava_source'},
                {'default:stick'},
        }
})

minetest.register_craft({
        output = 'default:obsidian 3',
        recipe = {
                {'default:obsidianbrick'},
        }
})