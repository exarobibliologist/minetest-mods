minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mario:block",
	wherein        = "default:stone",
	clust_scarcity = 6*6*6,
	clust_num_ores = 12,
	clust_size     = 3,
	height_min     = 0,
	height_max     = 1000,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mario:exclamationblock",
	wherein        = "default:stone",
	clust_scarcity = 6*6*6,
	clust_num_ores = 12,
	clust_size     = 3,
	height_min     = -1000,
	height_max     = 0,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mario:question1",
	wherein        = "default:stone",
	clust_scarcity = 6*6*6,
	clust_num_ores = 12,
	clust_size     = 3,
	height_min     = -3000,
	height_max     = -1000,
})

minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mario:question2",
	wherein        = "default:stone",
	clust_scarcity = 6*6*6,
	clust_num_ores = 12,
	clust_size     = 3,
	height_min     = -31000,
	height_max     = -3000,
})
