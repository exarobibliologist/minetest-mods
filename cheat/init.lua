minetest.register_craft({
	output = 'default:steelblock 4',
	recipe = {
		{'default:steel_ingot','default:steel_ingot'},
		{'default:steel_ingot','default:steel_ingot'},
	}
})

minetest.register_craft({
	output = 'default:iron_lump 5',
	recipe = {
		{'default:steelblock'},
	}
})

minetest.register_craft({
	output = 'default:gravel 4',
	recipe = {
		{'group:stone'},
	}
})

minetest.register_craft({
	output = 'default:coal_lump',
	recipe = {
		{'group:stone'},
		{'group:stone'},
	}
})

minetest.register_craft({
	output = 'default:iron_lump',
	recipe = {
		{'group:stone'},
		{'group:stone'},
		{'group:stone'},
	}
})

minetest.register_craft({
	output = 'default:dirt',
	recipe = {
		{'default:gravel'},
		{'default:gravel'},
		{'default:gravel'},
	}
})

minetest.register_craft({
        output = 'default:sandstone',
        recipe = {
                {'default:gravel'},
                {'default:gravel'},
        }
})

minetest.register_craft({
	output = 'default:tree',
	recipe = {
		{'default:dirt'},
		{'default:dirt'},
	}
})

minetest.register_craft({
	output = 'default:water_source',
	recipe = {
		{'default:dirt'},
		{'default:dirt'},
		{'default:dirt'},
	}
})

minetest.register_craft({
	output = 'default:lava_source',
	recipe = {
		{'default:iron_lump'},
		{'default:coal_lump'},
		{'default:iron_lump'},
	}
})