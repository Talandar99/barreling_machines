-----------------------------------------------------------------------------------------------------------------------
-- barreling category
-----------------------------------------------------------------------------------------------------------------------
for _, fluid in pairs(data.raw.fluid) do
	if data.raw.recipe["empty-" .. fluid.name .. "-barrel"] then
		data.raw.recipe["empty-" .. fluid.name .. "-barrel"].subgroup = "empty-steel-barrel"
		data.raw.recipe["empty-" .. fluid.name .. "-barrel"].factoriopedia_alternative = nil
		table.insert(data.raw.recipe["empty-" .. fluid.name .. "-barrel"].categories, "barreling")
		if data.raw.recipe["fill-" .. fluid.name .. "-barrel"] then
			data.raw.recipe["fill-" .. fluid.name .. "-barrel"].subgroup = "fill-steel-barrel"
			data.raw.recipe["fill-" .. fluid.name .. "-barrel"].factoriopedia_alternative = nil
			table.insert(data.raw.recipe["fill-" .. fluid.name .. "-barrel"].categories, "barreling")
		end
		if data.raw.recipe[fluid.name .. "-barrel"] then
			data.raw.recipe[fluid.name .. "-barrel"].subgroup = "fill-steel-barrel"
			data.raw.recipe[fluid.name .. "-barrel"].factoriopedia_alternative = nil
			table.insert(data.raw.recipe[fluid.name .. "-barrel"].categories, "barreling")
		end
		if data.raw.item[fluid.name .. "-barrel"] then
			data.raw.item[fluid.name .. "-barrel"].subgroup = "fill-steel-barrel"
			data.raw.item[fluid.name .. "-barrel"].factoriopedia_alternative = nil
		end
	end
end

require("prototypes.spoilable-wooden-barrel")
if mods["space-age"] then
	create_wooden_barrel_item({
		name = "ice-wooden-barrel",
		subgroup = "spoilable-wooden-barrel",
		side_color = { r = 0.5, g = 0.8, b = 1.0, a = 0.8 },
		top_color = { r = 0.9, g = 0.95, b = 1.0, a = 0.9 },
		spoil_ticks = 0.5 * hour,
		spoil_result = "water-wooden-barrel",
	})

	create_wooden_barrel_recipe({
		name = "ice-wooden-barrel",
		ingredients = {
			{ type = "item", name = "wooden-barrel", amount = 1 },
			{ type = "item", name = "ice", amount = 4 },
		},
		results = {
			{ type = "item", name = "ice-wooden-barrel", amount = 1 },
		},
	})

	create_wooden_barrel_item({
		name = "jelly-wooden-barrel",
		subgroup = "spoilable-wooden-barrel",
		top_color = { r = 0.50, g = 0.55, b = 0.11, a = 0.8 },
		side_color = { r = 0.43, g = 0.75, b = 0.31, a = 0.9 },
		spoil_ticks = 0.5 * hour,
		spoil_result = "lubricant-wooden-barrel",
	})

	create_wooden_barrel_recipe({
		name = "jelly-wooden-barrel",
		ingredients = {
			{ type = "item", name = "jelly", amount = 200 },
			{ type = "item", name = "wooden-barrel", amount = 1 },
		},
		results = {
			{ type = "item", name = "jelly-wooden-barrel", amount = 1 },
		},
	})

	create_wooden_barrel_item({
		name = "coal-liquification-wooden-barrel",
		subgroup = "spoilable-wooden-barrel",
		side_color = { r = 0.50, g = 0.13, b = 0.0, a = 0.8 },
		top_color = { r = 0.3, g = 0.3, b = 0.3, a = 0.9 },
		spoil_ticks = 0.5 * hour,
		spoil_result = "heavy-oil-wooden-barrel",
	})

	create_wooden_barrel_recipe({
		name = "coal-liquification-wooden-barrel",
		ingredients = {
			{ type = "item", name = "wooden-barrel", amount = 1 },
			{ type = "item", name = "coal", amount = 20 },
			{ type = "fluid", name = "steam", amount = 200 },
		},
		results = {
			{ type = "item", name = "coal-liquification-wooden-barrel", amount = 1 },
		},
	})
end

require("prototypes.wooden-barreling")
data.raw["item"]["wooden-barrel"].place_result = "wooden-barrel-placed"
if data.raw["item"]["titanium-plate"] then
	require("prototypes.titanium-barreling")
end
