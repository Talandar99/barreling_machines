local item_tints = require("__base__.prototypes.item-tints")
local item_sounds = require("__base__.prototypes.item_sounds")
if data.raw["item"]["titanium-plate"] then
	data:extend({
		{
			type = "item",
			name = "titanium-barrel",
			icon = "__barreling_machines__/graphics/titanium-barreling/empty-barrel.png",
			subgroup = "intermediate-product",
			order = "a[basic-intermediates]-d[empty-c-titanium-barrel]",
			inventory_move_sound = item_sounds.metal_chest_inventory_move,
			pick_sound = item_sounds.metal_chest_inventory_pickup,
			drop_sound = item_sounds.metal_chest_inventory_move,
			stack_size = 20,
			weight = 1 / 400 * tons,
			random_tint_color = item_tints.iron_rust,
		},
		{
			type = "recipe",
			name = "titanium-barrel",
			categories = { "advanced-crafting" },
			energy_required = 1,
			subgroup = "intermediate-product",
			order = "a[basic-intermediates]-d[empty-c-titanium-barrel]",
			enabled = false,
			ingredients = {
				{ type = "item", name = "titanium-plate", amount = 1 },
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
			prerequisites = { "space-science-pack", "utility-science-pack" },
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

	if mods["recycler"] then
		local recycling = require("__recycler__.recycling")
		recycling.generate_recycling_recipe(data.raw["recipe"]["titanium-barrel"])
	end
end
