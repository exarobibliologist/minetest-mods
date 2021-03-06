minetest.register_craftitem("mario:cloud", {
	description = "Mario Question Cloud",
	inventory_image = "mario_questioncloud.png",
	groups = {mario=1},
	on_use = minetest.item_eat(10),
})

minetest.register_craftitem("mario:pwing", {
	description = "Mario P-Wing",
	inventory_image = "mario_pwing.png",
	groups = {mario=1},
	on_use = minetest.item_eat(10),
})

minetest.register_craftitem("mario:coin", {
	description = "Mario Gold Coin",
	inventory_image = "mariocoin.png",
	groups = {mario=1},
	on_use = minetest.item_eat(10),
})

minetest.register_craftitem("mario:mushroom", {
	description = "Mario 1UP Mushroom",
	inventory_image = "mario_mushroom.png",
	groups = {mario=1},
	on_use = minetest.item_eat(500),
})

minetest.register_craftitem("mario:mario", {
	description = "It'za MARIO!",
	inventory_image = "mario.png",
	groups = {mario=1},
	full_punch_interval = 0.5,
})

minetest.register_craftitem("mario:supermario", {
	description = "Super Mario",
	inventory_image = "supermario.png",
	groups = {mario=1},
	full_punch_interval = 0.5,
})
