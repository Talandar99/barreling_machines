local item_tints = require("__base__.prototypes.item-tints")
local item_sounds = require("__base__.prototypes.item_sounds")
data:extend({
	{
		name = "wooden-barreling",
		type = "recipe-category",
	},
	{
		name = "barreling",
		type = "recipe-category",
	},
	{
		name = "titanium-barreling",
		type = "recipe-category",
	},
})

data:extend({
	{
		type = "item-group",
		name = "barreling",
		icon = "__barreling_machines__/graphics/wooden-barreling/wooden_barrel_technology.png",
		icon_size = 256,
		order = "fb",
		inventory_order = "fb",
	},
	{
		type = "item-subgroup",
		name = "barreling-machines",
		group = "production",
		order = "e-b",
	},
	{
		type = "item-subgroup",
		name = "barreling",
		group = "barreling",
		order = "a",
	},
	{
		type = "item-subgroup",
		name = "spoilable-wooden-barrel",
		group = "barreling",
		order = "a",
	},
	{
		type = "item-subgroup",
		name = "fill-wooden-barrel",
		group = "barreling",
		order = "b",
	},
	{
		type = "item-subgroup",
		name = "empty-wooden-barrel",
		group = "barreling",
		order = "c",
	},
	{
		type = "item-subgroup",
		name = "fill-steel-barrel",
		group = "barreling",
		order = "d",
	},
	{
		type = "item-subgroup",
		name = "empty-steel-barrel",
		group = "barreling",
		order = "e",
	},
	{
		type = "item-subgroup",
		name = "fill-titanium-barrel",
		group = "barreling",
		order = "f",
	},
	{
		type = "item-subgroup",
		name = "empty-titanium-barrel",
		group = "barreling",
		order = "g",
	},
})
require("prototypes.barreling-machines")

if data.raw["technology"]["fluid-handling"] then
	table.insert(
		data.raw["technology"]["fluid-handling"].effects,
		{ type = "unlock-recipe", recipe = "electric-barreling-machine" }
	)
end

data:extend({
	{
		type = "item",
		name = "wooden-barrel",
		icon = "__barreling_machines__/graphics/wooden-barreling/wooden_barrel.png",
		subgroup = "intermediate-product",
		order = "a[basic-intermediates]-d[empty-a-wooden-barrel]",
		inventory_move_sound = item_sounds.metal_chest_inventory_move,
		pick_sound = item_sounds.metal_chest_inventory_pickup,
		drop_sound = item_sounds.metal_chest_inventory_move,
		stack_size = 1,
		weight = 40 * kg,
		random_tint_color = item_tints.iron_rust,
	},
	{
		type = "recipe",
		name = "wooden-barrel",
		categories = { "advanced-crafting" },
		energy_required = 1,
		subgroup = "intermediate-product",
		order = "a[basic-intermediates]-d[empty-a-wooden-barrel]",
		enabled = false,
		ingredients = {
			{ type = "item", name = "wood", amount = 1 },
		},
		results = { { type = "item", name = "wooden-barrel", amount = 1 } },
		allow_productivity = true,
	},
	{
		type = "technology",
		name = "wooden-barrels",
		icon = "__barreling_machines__/graphics/wooden-barreling/wooden_barrel_technology.png",
		icon_size = 256,
		prerequisites = { "automation-science-pack" },
		effects = {
			{ type = "unlock-recipe", recipe = "burner-barreling-machine" },
			{ type = "unlock-recipe", recipe = "wooden-barrel" },
		},
		unit = {
			count = 25,
			ingredients = {
				{ "automation-science-pack", 1 },
			},
			time = 10,
		},
	},
})
if mods["space-age"] then
	data:extend({
		{
			type = "technology",
			name = "spoilable-wooden-barrels",
			icon = "__barreling_machines__/graphics/wooden-barreling/spoilable_wooden_barrel_technology.png",
			icon_size = 256,
			prerequisites = { "wooden-barrels", "agricultural-science-pack" },
			effects = {},
			unit = {
				count = 500,
				ingredients = {
					{ "automation-science-pack", 1 },
					{ "logistic-science-pack", 1 },
					{ "chemical-science-pack", 1 },
					{ "space-science-pack", 1 },
					{ "agricultural-science-pack", 1 },
				},
				time = 60,
			},
		},
	})
end
require("prototypes.compatibility.lignumis")
