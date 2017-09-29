minetest.register_craft({
	output = 'mario:feather_pick',
	recipe = {
		{'mario:supermario', 'mario:supermario', 'mario:supermario'},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'mario:weak_feather_pick',
	recipe = {
		{'mario:mario', 'mario:mario', 'mario:mario'},
		{'', 'default:stick', ''},
		{'', 'default:stick', ''},
	}
})

minetest.register_craft({
	output = 'default:torch 10',
	recipe = {
		{'mario:fireflower'},
		{'default:stick'},
	}
})

minetest.register_craft({
	output = 'mario:mario',
	recipe = {
		{'group:mario', 'group:mario', 'group:mario'},
		{'group:mario', 'group:mario', 'group:mario'},
		{'group:mario', 'group:mario', 'group:mario'},
	}
})

minetest.register_craft({
	output = 'mario:supermario',
	recipe = {
		{'mario:mario', 'mario:mario'},
		{'mario:mario', 'mario:mario'},
	}
})
