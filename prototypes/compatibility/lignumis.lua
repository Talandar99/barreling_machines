if mods["lignumis"] then
	data.raw["fluid"]["wood-pulp"].auto_wooden_barrel = true
	data.raw["technology"]["wooden-barrels"].prerequisites = { "wood-science-pack" }
	data.raw["technology"]["wooden-barrels"].unit = {
		count = 25,
		ingredients = {
			{ "wood-science-pack", 1 },
		},
		time = 10,
	}
	data.raw["recipe"]["wooden-barrel"].ingredients = {
		{ type = "item", name = "lumber", amount = 1 },
	}

	data.raw["recipe"]["burner-barreling-machine"].ingredients = {
		{ type = "item", name = "stone-brick", amount = 3 },
		{ type = "item", name = "lumber", amount = 3 },
		{ type = "item", name = "wooden-gear-wheel", amount = 2 },
	}
	table.insert(data.raw["recipe"]["wooden-barrel"].categories, "wood-processing")
end
