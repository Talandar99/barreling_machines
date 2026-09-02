local item_tints = require("__base__.prototypes.item-tints")
local item_sounds = require("__base__.prototypes.item_sounds")
data:extend({
	{
		name = "barreling",
		type = "recipe-category",
	},
})

data:extend({
	{
		type = "item-group",
		name = "barreling",
		icon = "__barreling_machines__/graphics/titanium-barreling/titanium-barrels.png",
		icon_size = 512,
		order = "z",
		inventory_order = "z",
	},
	{
		type = "item-subgroup",
		name = "barreling",
		group = "barreling",
		order = "a",
	},
	{
		type = "item-subgroup",
		name = "fill-wood-barrel",
		group = "barreling",
		order = "a",
	},
	{
		type = "item-subgroup",
		name = "empty-wood-barrel",
		group = "barreling",
		order = "b",
	},
	{
		type = "item-subgroup",
		name = "fill-steel-barrel",
		group = "barreling",
		order = "c",
	},
	{
		type = "item-subgroup",
		name = "empty-steel-barrel",
		group = "barreling",
		order = "d",
	},
	{
		type = "item-subgroup",
		name = "fill-titanium-barrel",
		group = "barreling",
		order = "e",
	},
	{
		type = "item-subgroup",
		name = "empty-titanium-barrel",
		group = "barreling",
		order = "f",
	},
})
require("prototypes.barreling-machines")

if data.raw["technology"]["fluid-handling"] then
	table.insert(
		data.raw["technology"]["fluid-handling"].effects,
		{ type = "unlock-recipe", recipe = "burner-barreling-machine" }
	)
end

if data.raw["technology"]["chemical-science-pack"] then
	table.insert(
		data.raw["technology"]["chemical-science-pack"].effects,
		{ type = "unlock-recipe", recipe = "electric-barreling-machine" }
	)
end

data.extend({
	{
		type = "item",
		name = "titanium-barrel",
		icon = "__barreling_machines__/graphics/titanium-barreling/empty-barrel.png",
		subgroup = "intermediate-product",
		order = "a[basic-intermediates]-d[empty-titanium-barrel]",
		inventory_move_sound = item_sounds.metal_chest_inventory_move,
		pick_sound = item_sounds.metal_chest_inventory_pickup,
		drop_sound = item_sounds.metal_chest_inventory_move,
		stack_size = 20,
		--default_import_location = "pelagos",
		weight = 1 / 400 * tons,
		random_tint_color = item_tints.iron_rust,
	},
	{
		type = "recipe",
		name = "titanium-barrel",
		categories = { "advanced-crafting" },
		energy_required = 1,
		subgroup = "intermediate-product",
		enabled = false,
		ingredients = {
			--{ type = "item", name = "titanium-plate", amount = 1 },
			{ type = "item", name = "iron-plate", amount = 1 },
		},
		results = { { type = "item", name = "titanium-barrel", amount = 1 } },
		allow_productivity = true,
	},
	{
		type = "technology",
		name = "titanium-barrels",
		icon = "__barreling_machines__/graphics/titanium-barreling/titanium-barrels.png",
		icon_size = 512,
		effects = {
			{ type = "unlock-recipe", recipe = "titanium-barrel" },
		},
		unit = {
			count = 1000,
			ingredients = {
				{ "automation-science-pack", 1 },
				{ "logistic-science-pack", 1 },
				{ "chemical-science-pack", 1 },
				{ "space-science-pack", 1 },
				{ "utility-science-pack", 1 },
			},
			time = 60,
		},
	},
})
