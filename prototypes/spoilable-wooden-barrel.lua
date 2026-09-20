function create_wooden_barrel_item(params)
	if not params or not params.name then
		log("Error: create_wooden_barrel_item requires 'name'.")
		return nil
	end

	local empty_barrel = data.raw.item["wooden-barrel"]
	local default_icon_size = empty_barrel and empty_barrel.icon_size or defines.default_icon_size
	local default_stack = empty_barrel and empty_barrel.stack_size or 10

	local fill_icon = "__barreling_machines__/graphics/wooden-barreling/wooden_barrel.png"
	local side_mask = "__barreling_machines__/graphics/wooden-barreling/wooden_barrel_mask_side.png"
	local top_mask = "__barreling_machines__/graphics/wooden-barreling/wooden_barrel_mask_top.png"

	local item_sounds = require("__base__.prototypes.item_sounds")

	local side_alpha = params.side_alpha or 0.75
	local top_alpha = params.top_alpha or 0.75

	local side_tint = params.side_color and util.get_color_with_alpha(params.side_color, side_alpha, true)
		or { r = 1, g = 1, b = 1, a = side_alpha }
	local top_tint = params.top_color and util.get_color_with_alpha(params.top_color, top_alpha, true)
		or { r = 1, g = 1, b = 1, a = top_alpha }

	local barrel_item = {
		type = "item",
		name = params.name,
		localised_name = params.localised_name,
		icons = {
			{ icon = fill_icon, icon_size = default_icon_size },
			{ icon = side_mask, icon_size = default_icon_size, tint = side_tint },
			{ icon = top_mask, icon_size = default_icon_size, tint = top_tint },
		},
		subgroup = params.subgroup or "spoilable-wooden-barrel",
		order = params.order or "a[wooden-barrel]",
		weight = 100 * kg,
		inventory_move_sound = item_sounds.metal_barrel_inventory_move,
		pick_sound = item_sounds.metal_barrel_inventory_pickup,
		drop_sound = item_sounds.metal_barrel_inventory_move,
		stack_size = params.stack_size or default_stack,
		spoil_ticks = params.spoil_ticks,
		spoil_result = params.spoil_result,
	}

	data:extend({ barrel_item })
	return barrel_item
end

function create_wooden_barrel_recipe(params)
	if not params or not params.name then
		log("Error: create_wooden_barrel_recipe requires 'name'.")
		return nil
	end

	local barrel_recipe = {
		type = "recipe",
		name = params.name,
		localised_name = params.localised_name,
		icons = params.icons,
		icon = params.icon,
		icon_size = params.icon_size,
		subgroup = params.subgroup or "spoilable-wooden-barrel",
		categories = params.categories or { "wooden-barreling" },
		energy_required = params.energy_required or 0.2,
		enabled = params.enabled or false,
		ingredients = params.ingredients or {},
		results = params.results or {},
		crafting_machine_tint = params.crafting_machine_tint,
		hide_from_player_crafting = params.hide_from_player_crafting,
	}

	data:extend({ barrel_recipe })

	local tech_name = params.technology or "spoilable-wooden-barrels"
	local tech = data.raw["technology"][tech_name]
	if tech then
		tech.effects = tech.effects or {}
		table.insert(tech.effects, {
			type = "unlock-recipe",
			recipe = params.name,
		})
	end

	return barrel_recipe
end
