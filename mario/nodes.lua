minetest.register_node("mario:block", {
	description = "Block",
	tiles = {"block1.png"},
	is_ground_content = true,
	groups = {oddly_breakable_by_hand=1, cracky=3, stone=1},
	drop = {
		max_items = 1,
		items = {
			{ items = {'mario:cloud'}, rarity = 2 },
			{ items = {'mario:pwing'}, rarity = 2 },
			{ items = {'mario:coin'}, rarity = 2 },
			{ items = {'mario:mushroom'}, rarity = 2 },
			{ items = {'mario:fireflower'}, rarity = 2 },
			{ items = {'default:wood'}, rarity = 3 },
			{ items = {'default:cobble'}, rarity = 3 },
			{ items = {'default:sand'}, rarity = 3 },
			{ items = {'default:tree'}, rarity = 4 },
			{ items = {'default:iron_lump'}, rarity = 4 },
			{ items = {'default:copper_lump'}, rarity = 4 },
			{ items = {'default:coal_lump'}, rarity = 4 },
			{ items = {'default:mese_crystal'}, rarity = 5 },
			{ items = {'default:obsidian'}, rarity = 5 },
			{ items = {'default:nyancat'}, rarity = 5 },
			{ items = {'default:nyancat_rainbow'}, rarity = 5 }
			}
	} ,
	legacy_mineral = true,
})

minetest.register_node("mario:exclamationblock", {
	description = "Exclamation Block",
	tiles = {"exclamationblock.png"},
	is_ground_content = true,
	groups = {oddly_breakable_by_hand=1, cracky=3, stone=1},
	drop = {
		max_items = 2,
		items = {
			{ items = {'mario:cloud'}, rarity = 2 },
			{ items = {'mario:pwing'}, rarity = 2 },
			{ items = {'mario:coin'}, rarity = 2 },
			{ items = {'mario:mushroom'}, rarity = 2 },
			{ items = {'mario:fireflower'}, rarity = 2 },
			{ items = {'default:wood'}, rarity = 3 },
			{ items = {'default:cobble'}, rarity = 3 },
			{ items = {'default:sand'}, rarity = 3 },
			{ items = {'default:tree'}, rarity = 4 },
			{ items = {'default:iron_lump'}, rarity = 4 },
			{ items = {'default:copper_lump'}, rarity = 4 },
			{ items = {'default:coal_lump'}, rarity = 4 },
			{ items = {'default:mese_crystal'}, rarity = 5 },
			{ items = {'default:obsidian'}, rarity = 5 },
			{ items = {'default:nyancat'}, rarity = 5 },
			{ items = {'default:nyancat_rainbow'}, rarity = 5 }
			}
	} ,
	legacy_mineral = true,
})

minetest.register_node("mario:question1", {
	description = "Question Block",
	tiles = {"questionblock1.png"},
	is_ground_content = true,
	groups = {oddly_breakable_by_hand=1, cracky=3, stone=1},
	drop = {
		max_items = 3,
		items = {
			{ items = {'mario:cloud'}, rarity = 2 },
			{ items = {'mario:pwing'}, rarity = 2 },
			{ items = {'mario:coin'}, rarity = 2 },
			{ items = {'mario:mushroom'}, rarity = 2 },
			{ items = {'mario:fireflower'}, rarity = 2 },
			{ items = {'default:wood'}, rarity = 3 },
			{ items = {'default:cobble'}, rarity = 3 },
			{ items = {'default:sand'}, rarity = 3 },
			{ items = {'default:tree'}, rarity = 4 },
			{ items = {'default:iron_lump'}, rarity = 4 },
			{ items = {'default:copper_lump'}, rarity = 4 },
			{ items = {'default:coal_lump'}, rarity = 4 },
			{ items = {'default:mese_crystal'}, rarity = 5 },
			{ items = {'default:obsidian'}, rarity = 5 },
			{ items = {'default:nyancat'}, rarity = 5 },
			{ items = {'default:nyancat_rainbow'}, rarity = 5 }
			}
	} ,
	legacy_mineral = true,
})

minetest.register_node("mario:question2", {
	description = "Question Block",
	tiles = {"questionblock2.png"},
	is_ground_content = true,
	groups = {oddly_breakable_by_hand=1, cracky=3, stone=1},
	drop = {
		max_items = 3,
		items = {
			{ items = {'mario:cloud'}, rarity = 2 },
			{ items = {'mario:pwing'}, rarity = 2 },
			{ items = {'mario:coin'}, rarity = 2 },
			{ items = {'mario:mushroom'}, rarity = 2 },
			{ items = {'mario:fireflower'}, rarity = 2 },
			{ items = {'default:wood'}, rarity = 3 },
			{ items = {'default:cobble'}, rarity = 3 },
			{ items = {'default:sand'}, rarity = 3 },
			{ items = {'default:tree'}, rarity = 4 },
			{ items = {'default:iron_lump'}, rarity = 4 },
			{ items = {'default:copper_lump'}, rarity = 4 },
			{ items = {'default:coal_lump'}, rarity = 4 },
			{ items = {'default:mese_crystal'}, rarity = 5 },
			{ items = {'default:obsidian'}, rarity = 5 },
			{ items = {'default:nyancat'}, rarity = 5 },
			{ items = {'default:nyancat_rainbow'}, rarity = 5 }
			}
	} ,
	legacy_mineral = true,
})

minetest.register_node("mario:fireflower", {
	description = "Mario Fire Flower",
	drawtype = "signlike",
	tiles = {"mario_fireflower.png"},
	inventory_image = "mario_fireflower.png",
	paramtype = 'light',
	paramtype2 = "wallmounted",
	light_propagates = true,
	sunlight_propagates = true,
	light_source = LIGHT_MAX ,
	is_ground_content = true,
	full_punch_interval = 0.5,
	groups = {mario=1, oddly_breakable_by_hand=1, cracky=3, stone=1},
	drop = 'mario:fireflower',
	legacy_mineral = true,
})

