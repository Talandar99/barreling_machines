local item_sounds = require("__base__.prototypes.item_sounds")

local technology_name = "wooden-barrels"
local empty_barrel_name = "wooden-barrel"

local barrel_empty_icon = "__barreling_machines__/graphics/wooden-barreling/wooden_barrel_empty.png"
local barrel_empty_side_mask = "__barreling_machines__/graphics/wooden-barreling/wooden_barrel_empty_mask_side.png"
local barrel_empty_top_mask = "__barreling_machines__/graphics/wooden-barreling/wooden_barrel_empty_mask_top.png"

local barrel_fill_icon = "__barreling_machines__/graphics/wooden-barreling/wooden_barrel.png"
local barrel_side_mask = "__barreling_machines__/graphics/wooden-barreling/wooden_barrel_mask_side.png"
local barrel_fill_top_mask = "__barreling_machines__/graphics/wooden-barreling/wooden_barrel_mask_top.png"

local side_alpha = 0.75
local top_hoop_alpha = 0.75
local fluid_per_barrel = 200
local energy_per_fill = 0.2
local energy_per_empty = 0.2

local wooden_barrel_fluids = {
	["water"] = true,
	["crude-oil"] = true,
	["heavy-oil"] = true,
	["light-oil"] = true,
	["lubricant"] = true,
}

local function get_item(name)
	for typeName in pairs(defines.prototypes.item) do
		local items = data.raw[typeName]
		if items and items[name] then
			return items[name]
		end
	end
	return nil
end

for fluid_name, value in pairs(wooden_barrel_fluids) do
	if data.raw.fluid[fluid_name] then
		data.raw.fluid[fluid_name].auto_wooden_barrel = value
	end
end

local function get_technology(name)
	return data.raw["technology"] and data.raw["technology"][name]
end

local function get_recipes_for_barrel(name)
	local recipes = data.raw["recipe"]
	if recipes then
		return recipes[name], recipes["empty-" .. name]
	end
	return nil
end

local function generate_barrel_icons(fluid, base_icon, side_mask, top_mask)
	return {
		{
			icon = base_icon.icon or base_icon,
			icon_size = base_icon.icon_size or defines.default_icon_size,
		},
		{
			icon = side_mask,
			icon_size = defines.default_icon_size,
			tint = util.get_color_with_alpha(fluid.base_color, side_alpha, true),
		},
		{
			icon = top_mask,
			icon_size = defines.default_icon_size,
			tint = util.get_color_with_alpha(fluid.flow_color, top_hoop_alpha, true),
		},
	}
end

local placed_barrel_entity = {
	type = "storage-tank",
	name = "wooden-barrel-placed",
	localised_name = { "item-name.wooden-barrel" },
	icon = barrel_fill_icon,
	icon_size = defines.default_icon_size,
	flags = { "placeable-neutral", "player-creation" },
	minable = { mining_time = 0.2, result = empty_barrel_name }, -- Zawsze wykopuje czystą beczkę
	max_health = 100,
	corpse = "small-remnants",
	collision_box = { { -0.35, -0.35 }, { 0.35, 0.35 } },
	selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
	subgroup = "empty-wooden-barrel",
	order = "a[wooden-barrel-placed]",
	hidden = true,
	hide_from_signal_gui = true,
	icon_draw_specification = { scale = 0.5 },
	fluid_box = {
		volume = fluid_per_barrel,
		pipe_covers = pipecoverspictures(),
		pipe_picture = {
			north = {
				filename = "__barreling_machines__/graphics/wooden-barreling/wooden_barrel_placeable_pipe_N.png",
				priority = "extra-high",
				width = 192,
				height = 192,
				scale = 0.5,
				shift = util.by_pixel(0, 32),
			},
			east = {
				filename = "__barreling_machines__/graphics/wooden-barreling/wooden_barrel_placeable_pipe_E.png",
				priority = "extra-high",
				width = 192,
				height = 192,
				scale = 0.5,
				shift = util.by_pixel(-32, 0),
			},
			south = {
				filename = "__barreling_machines__/graphics/wooden-barreling/wooden_barrel_placeable_pipe_S.png",
				priority = "extra-high",
				width = 192,
				height = 192,
				scale = 0.5,
				shift = util.by_pixel(0, -32),
			},
			west = {
				filename = "__barreling_machines__/graphics/wooden-barreling/wooden_barrel_placeable_pipe_W.png",
				priority = "extra-high",
				width = 192,
				height = 192,
				scale = 0.5,
				shift = util.by_pixel(32, 0),
			},
		},
		pipe_connections = {
			{ direction = defines.direction.south, position = { 0, 0 } },
		},
	},
	two_direction_only = false,
	window_bounding_box = { { -0.05, -0.05 }, { 0.05, 0.05 } },
	pictures = {
		picture = {
			sheets = {
				{
					filename = "__barreling_machines__/graphics/wooden-barreling/wooden_barrel_placeable.png",
					priority = "extra-high",
					frames = 1,
					width = 192,
					height = 192,
					scale = 0.5,
				},
				{
					filename = "__barreling_machines__/graphics/wooden-barreling/wooden_barrel_placeable_shadow.png",
					priority = "extra-high",
					draw_as_shadow = true,
					frames = 1,
					width = 192,
					height = 192,
					scale = 0.5,
				},
			},
		},
		fluid_background = util.empty_sprite(),
		window_background = util.empty_sprite(),
		flow_sprite = util.empty_sprite(),
	},
	flow_length_in_ticks = 360,
}

data:extend({ placed_barrel_entity })

local function create_barrel_placeable_entity(fluid)
	local entity_name = "wooden-barrel-placed-" .. fluid.name

	local entity = table.deepcopy(placed_barrel_entity)
	entity.name = entity_name
	entity.minable = { mining_time = 0.2, result = empty_barrel_name }

	entity.created_effect = {
		type = "direct",
		action_delivery = {
			type = "instant",
			source_effects = {
				type = "script",
				effect_id = "wooden-barrel-placed",
			},
		},
	}

	data:extend({ entity })
	return entity_name
end

local function create_barrel_item(name, fluid, empty_barrel_item)
	local entity_name = create_barrel_placeable_entity(fluid)

	local result = {
		type = "item",
		name = name,
		localised_name = { "item-name.filled-wooden-barrel", fluid.localised_name or { "fluid-name." .. fluid.name } },
		icons = generate_barrel_icons(fluid, barrel_fill_icon, barrel_side_mask, barrel_fill_top_mask),
		icon_size = empty_barrel_item.icon_size or defines.default_icon_size,
		subgroup = "fill-wooden-barrel",
		order = fluid.order or ("b[" .. fluid.name .. "]"),
		weight = data.raw["item"]["wooden-barrel"] and data.raw["item"]["wooden-barrel"].weight or (100 * kg),
		inventory_move_sound = item_sounds.metal_barrel_inventory_move,
		pick_sound = item_sounds.metal_barrel_inventory_pickup,
		drop_sound = item_sounds.metal_barrel_inventory_move,
		stack_size = empty_barrel_item.stack_size,
		place_result = entity_name,
	}

	data:extend({ result })
	return result
end

local function get_or_create_barrel_item(name, fluid, empty_barrel_item)
	local existing_item = get_item(name)
	if existing_item then
		return existing_item
	end

	return create_barrel_item(name, fluid, empty_barrel_item)
end

local function generate_barrel_recipe_icons(fluid, base_icon, side_mask, top_mask, fluid_icon_shift)
	local icons = generate_barrel_icons(fluid, base_icon, side_mask, top_mask)
	if fluid.icon then
		local icon_size = fluid.icon_size or 64
		table.insert(icons, {
			icon = fluid.icon,
			icon_size = icon_size,
			scale = 16.0 / icon_size,
			shift = fluid_icon_shift,
		})
	elseif fluid.icons then
		local icon_size = fluid.icon_size or (fluid.icons[1] and fluid.icons[1].icon_size) or defines.default_icon_size
		icons = util.combine_icons(icons, fluid.icons, { scale = 0.5, shift = fluid_icon_shift }, icon_size)
	end

	return icons
end

local function create_fill_barrel_recipe(item, fluid)
	local recipe_name = item.name
	local recipe = {
		type = "recipe",
		name = recipe_name,
		localised_name = { "recipe-name.fill-wooden-barrel", fluid.localised_name or { "fluid-name." .. fluid.name } },
		categories = { "wooden-barreling" },
		energy_required = energy_per_fill,
		subgroup = "fill-wooden-barrel",
		order = fluid.order or ("b[" .. fluid.name .. "]"),
		enabled = false,
		icons = generate_barrel_recipe_icons(
			fluid,
			barrel_fill_icon,
			barrel_side_mask,
			barrel_fill_top_mask,
			{ -8, -8 }
		),
		ingredients = {
			{ type = "fluid", name = fluid.name, amount = fluid_per_barrel, ignored_by_stats = fluid_per_barrel },
			{ type = "item", name = empty_barrel_name, amount = 1, ignored_by_stats = 1 },
		},
		results = {
			{ type = "item", name = item.name, amount = 1, ignored_by_stats = 1 },
		},
		allow_quality = false,
		allow_decomposition = false,
		hide_from_player_crafting = true,
		hide_from_signal_gui = false,
	}

	data:extend({ recipe })
	return recipe
end

local function create_empty_barrel_recipe(item, fluid)
	local recipe_name = "empty-" .. item.name
	local recipe = {
		type = "recipe",
		name = recipe_name,
		localised_name = {
			"recipe-name.empty-filled-wooden-barrel",
			fluid.localised_name or { "fluid-name." .. fluid.name },
		},
		categories = { "wooden-barreling" },
		energy_required = energy_per_empty,
		subgroup = "empty-wooden-barrel",
		order = fluid.order or ("b[" .. fluid.name .. "]"),
		enabled = false,
		icons = generate_barrel_recipe_icons(
			fluid,
			barrel_empty_icon,
			barrel_empty_side_mask,
			barrel_empty_top_mask,
			{ 7, 8 }
		),
		ingredients = {
			{ type = "item", name = item.name, amount = 1, ignored_by_stats = 1 },
		},
		results = {
			{ type = "fluid", name = fluid.name, amount = fluid_per_barrel, ignored_by_stats = fluid_per_barrel },
			{ type = "item", name = empty_barrel_name, amount = 1, ignored_by_stats = 1 },
		},
		allow_quality = false,
		allow_decomposition = false,
		hide_from_player_crafting = true,
		hide_from_signal_gui = false,
		unlock_results = false,
	}

	data:extend({ recipe })
	return recipe
end

local function get_or_create_barrel_recipes(item, fluid)
	local fill_recipe, empty_recipe = get_recipes_for_barrel(item.name)

	if not fill_recipe then
		fill_recipe = create_fill_barrel_recipe(item, fluid)
	end
	if not empty_recipe then
		empty_recipe = create_empty_barrel_recipe(item, fluid)
	end

	return fill_recipe, empty_recipe
end

local function add_barrel_to_technology(fill_recipe, empty_recipe, technology)
	local unlock_key = "unlock-recipe"
	local effects = technology.effects

	if not effects then
		technology.effects = {}
		effects = technology.effects
	end

	local add_fill_recipe = true
	local add_empty_recipe = true

	for k, v in pairs(effects) do
		if k == unlock_key then
			local recipe = v.recipe
			if recipe == fill_recipe.name then
				add_fill_recipe = false
			elseif recipe == empty_recipe.name then
				add_empty_recipe = false
			end
		end
	end

	if add_fill_recipe then
		table.insert(effects, { type = unlock_key, recipe = fill_recipe.name })
	end
	if add_empty_recipe then
		table.insert(effects, { type = unlock_key, recipe = empty_recipe.name })
	end
end

local function log_barrel_error(str)
	log("Auto barrel generation is disabled: " .. str .. ".")
end

local function can_process_fluids(fluids, technology, empty_barrel_item)
	if not fluids then
		log_barrel_error("there are no fluids")
		return
	end

	if not technology then
		log_barrel_error("the " .. technology_name .. " technology doesn't exist")
		return
	end

	if not empty_barrel_item then
		log_barrel_error("the " .. empty_barrel_name .. " item doesn't exist")
		return
	end

	if not empty_barrel_item.icon then
		log_barrel_error("the " .. empty_barrel_name .. " item singular-icon definition doesn't exist")
		return
	end

	return true
end

local function process_fluid(fluid, technology, empty_barrel_item)
	if fluid.auto_wooden_barrel ~= true then
		return
	end

	if not (fluid.icon or fluid.icons) then
		log("Can't make barrel recipe for " .. fluid.name .. ", it doesn't have any icon or icons.")
		return
	end

	local barrel_name = fluid.name .. "-wooden-barrel"
	local barrel_item = get_or_create_barrel_item(barrel_name, fluid, empty_barrel_item)
	local barrel_fill_recipe, barrel_empty_recipe = get_or_create_barrel_recipes(barrel_item, fluid)
	add_barrel_to_technology(barrel_fill_recipe, barrel_empty_recipe, technology)
end

local function process_fluids(fluids, technology, empty_barrel_item)
	if not can_process_fluids(fluids, technology, empty_barrel_item) then
		return
	end

	for _, fluid in pairs(fluids) do
		process_fluid(fluid, technology, empty_barrel_item)
	end
end

process_fluids(data.raw["fluid"], get_technology(technology_name), get_item(empty_barrel_name))
