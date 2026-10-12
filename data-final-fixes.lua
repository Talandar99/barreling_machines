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
	create_wooden_barrel({
		name = "ice-wooden-barrel",
		subgroup = "spoilable-wooden-barrel",
		side_color = { r = 0.5, g = 0.8, b = 1.0, a = 0.8 },
		top_color = { r = 0.9, g = 0.95, b = 1.0, a = 0.9 },
		spoil_ticks = 0.5 * hour,
		spoil_result = "water-wooden-barrel",
	}, {
		{ type = "item", name = "wooden-barrel", amount = 1 },
		{ type = "item", name = "ice", amount = 4 },
	})

	create_wooden_barrel({
		name = "jelly-wooden-barrel",
		subgroup = "spoilable-wooden-barrel",
		top_color = { r = 0.50, g = 0.55, b = 0.11, a = 0.8 },
		side_color = { r = 0.43, g = 0.75, b = 0.31, a = 0.9 },
		spoil_ticks = 0.5 * hour,
		spoil_result = "lubricant-wooden-barrel",
	}, {
		{ type = "item", name = "jelly", amount = 200 },
		{ type = "item", name = "wooden-barrel", amount = 1 },
	})

	create_wooden_barrel({
		name = "coal-liquefaction-wooden-barrel",
		subgroup = "spoilable-wooden-barrel",
		side_color = { r = 0.50, g = 0.13, b = 0.0, a = 0.8 },
		top_color = { r = 0.3, g = 0.3, b = 0.3, a = 0.9 },
		spoil_ticks = 0.5 * hour,
		spoil_result = "heavy-oil-wooden-barrel",
	}, {
		{ type = "item", name = "wooden-barrel", amount = 1 },
		{ type = "item", name = "coal", amount = 20 },
		{ type = "fluid", name = "steam", amount = 200 },
	})
	if (data.raw.item["sand"] ~= nil) and mods["planetaris-arig"] then
		create_wooden_barrel({
			name = "sand-wooden-barrel",
			subgroup = "spoilable-wooden-barrel",
			side_color = { r = 0.85, g = 0.76, b = 0.58, a = 0.8 },
			top_color = { r = 0.92, g = 0.85, b = 0.68, a = 0.9 },
		})
		create_wooden_barrel({
			name = "sticky-sand-wooden-barrel",
			subgroup = "spoilable-wooden-barrel",
			side_color = { r = 0.72, g = 0.62, b = 0.48, a = 0.8 },
			top_color = { r = 0.25, g = 0.23, b = 0.21, a = 0.9 },
			spoil_ticks = 0.5 * hour,
			spoil_result = "sand-wooden-barrel",
		}, {
			{ type = "item", name = "wooden-barrel", amount = 1 },
			{ type = "fluid", name = "planetaris-pure-sand", amount = 200 },
			{ type = "item", name = "solid-fuel", amount = 1 },
		})
		data:extend({
			{
				type = "recipe",
				name = "empty-sand-wooden-barrel",
				localised_name = { "recipe-name.empty-filled-wooden-barrel", { "item-name.sand" } },
				categories = { "wooden-barreling" },
				energy_required = 0.2,
				subgroup = "empty-wooden-barrel",
				order = "b[sand]",
				enabled = false,
				icons = {
					{
						icon = "__barreling_machines__/graphics/wooden-barreling/wooden_barrel_empty.png",
						icon_size = 64,
					},
					{
						icon = "__barreling_machines__/graphics/wooden-barreling/wooden_barrel_empty_mask_side.png",
						icon_size = 64,
						tint = { r = 0.85, g = 0.76, b = 0.58, a = 0.8 },
					},
					{
						icon = "__barreling_machines__/graphics/wooden-barreling/wooden_barrel_empty_mask_top.png",
						icon_size = 64,
						tint = { r = 0.92, g = 0.85, b = 0.68, a = 0.9 },
					},
					{
						icon = data.raw.item["sand"].icon,
						icon_size = data.raw.item["sand"].icon_size or 64,
						scale = 16.0 / (data.raw.item["sand"].icon_size or 64),
						shift = { 7, 8 },
					},
				},
				ingredients = {
					{ type = "item", name = "sand-wooden-barrel", amount = 1, ignored_by_stats = 1 },
				},
				results = {
					{ type = "item", name = "sand", amount = 200, ignored_by_stats = 200 },
					{ type = "item", name = "wooden-barrel", amount = 1, ignored_by_stats = 1 },
				},
				allow_quality = false,
				allow_decomposition = false,
				hide_from_player_crafting = true,
				hide_from_signal_gui = false,
				unlock_results = false,
			},
		})

		if data.raw["technology"]["spoilable-wooden-barrel"] then
			data.raw["technology"]["spoilable-wooden-barrel"].effects = data.raw["technology"]["spoilable-wooden-barrel"].effects
				or {}
			table.insert(data.raw["technology"]["spoilable-wooden-barrel"].effects, {
				type = "unlock-recipe",
				recipe = "empty-sand-wooden-barrels",
			})
		end
	end
end

require("prototypes.wooden-barreling")
data.raw["item"]["wooden-barrel"].place_result = "wooden-barrel-placed"
if data.raw["item"]["titanium-plate"] then
	require("prototypes.titanium-barreling")
end
