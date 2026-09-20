local item_sounds = require("__base__.prototypes.item_sounds")
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")
--icon scale was 1.63
--camera -7.57
-------------------------------------------------------------------------------
-- PIPE FUNCTIONS
-------------------------------------------------------------------------------

function electric_barreling_machine_pipes()
	return {
		north = {
			filename = "__barreling_machines__/graphics/barreling_machines/electric_barreling_machine_pipe_connectors_N.png",
			priority = "extra-high",
			width = 128,
			height = 128,
			shift = util.by_pixel(0, 32),
			scale = 0.5,
		},
		east = {
			filename = "__barreling_machines__/graphics/barreling_machines/electric_barreling_machine_pipe_connectors_E.png",
			priority = "extra-high",
			width = 128,
			height = 128,
			shift = util.by_pixel(-32, 0),
			scale = 0.5,
		},
		south = {
			filename = "__barreling_machines__/graphics/barreling_machines/electric_barreling_machine_pipe_connectors_S.png",
			priority = "extra-high",
			width = 128,
			height = 128,
			shift = util.by_pixel(0, -32),
			scale = 0.5,
		},
		west = {
			filename = "__barreling_machines__/graphics/barreling_machines/electric_barreling_machine_pipe_connectors_W.png",
			priority = "extra-high",
			width = 128,
			height = 128,
			shift = util.by_pixel(32, 0),
			scale = 0.5,
		},
	}
end

function burner_barreling_machine_pipes()
	return {
		north = {
			filename = "__barreling_machines__/graphics/barreling_machines/burner_barreling_machine_pipe_connectors_N.png",
			priority = "extra-high",
			width = 128,
			height = 128,
			shift = util.by_pixel(0, 32),
			scale = 0.5,
		},
		east = {
			filename = "__barreling_machines__/graphics/barreling_machines/burner_barreling_machine_pipe_connectors_E.png",
			priority = "extra-high",
			width = 128,
			height = 128,
			shift = util.by_pixel(-32, 0),
			scale = 0.5,
		},
		south = {
			filename = "__barreling_machines__/graphics/barreling_machines/burner_barreling_machine_pipe_connectors_S.png",
			priority = "extra-high",
			width = 128,
			height = 128,
			shift = util.by_pixel(0, -32),
			scale = 0.5,
		},
		west = {
			filename = "__barreling_machines__/graphics/barreling_machines/burner_barreling_machine_pipe_connectors_W.png",
			priority = "extra-high",
			width = 128,
			height = 128,
			shift = util.by_pixel(32, 0),
			scale = 0.5,
		},
	}
end

function diesel_barreling_machine_pipes()
	return {
		north = {
			filename = "__barreling_machines__/graphics/barreling_machines/diesel_barreling_machine_pipe_connectors_N.png",
			priority = "extra-high",
			width = 128,
			height = 128,
			shift = util.by_pixel(0, 32),
			scale = 0.5,
		},
		east = {
			filename = "__barreling_machines__/graphics/barreling_machines/diesel_barreling_machine_pipe_connectors_E.png",
			priority = "extra-high",
			width = 128,
			height = 128,
			shift = util.by_pixel(-32, 0),
			scale = 0.5,
		},
		south = {
			filename = "__barreling_machines__/graphics/barreling_machines/diesel_barreling_machine_pipe_connectors_S.png",
			priority = "extra-high",
			width = 128,
			height = 128,
			shift = util.by_pixel(0, -32),
			scale = 0.5,
		},
		west = {
			filename = "__barreling_machines__/graphics/barreling_machines/diesel_barreling_machine_pipe_connectors_W.png",
			priority = "extra-high",
			width = 128,
			height = 128,
			shift = util.by_pixel(32, 0),
			scale = 0.5,
		},
	}
end

-------------------------------------------------------------------------------
-- REMNANTS
-------------------------------------------------------------------------------

data:extend({
	{
		type = "corpse",
		name = "burner-barreling-machine-remnants",
		icon = "__barreling_machines__/graphics/barreling_machines/burner_barreling_machine_icon.png",
		icon_size = 64,
		flags = { "placeable-neutral", "not-on-map" },
		subgroup = "remnants",
		order = "a-a-a",
		selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
		tile_width = 1,
		tile_height = 1,
		selectable_in_game = false,
		time_before_removed = 60 * 60 * 15,
		final_render_layer = "remnants",
		animation = {
			filename = "__barreling_machines__/graphics/barreling_machines/burner_barreling_machine_remnants.png",
			priority = "extra-high",
			width = 137,
			height = 137,
			frame_count = 1,
			direction_count = 1,
			shift = util.by_pixel(0, 0),
			scale = 0.5,
		},
	},
	{
		type = "corpse",
		name = "electric-barreling-machine-remnants",
		icon = "__barreling_machines__/graphics/barreling_machines/electric_barreling_machine_icon.png",
		icon_size = 64,
		flags = { "placeable-neutral", "not-on-map" },
		subgroup = "remnants",
		order = "a-a-a",
		selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
		tile_width = 1,
		tile_height = 1,
		selectable_in_game = false,
		time_before_removed = 60 * 60 * 15,
		final_render_layer = "remnants",
		animation = {
			filename = "__barreling_machines__/graphics/barreling_machines/electric_barreling_machine_remnants.png",
			priority = "extra-high",
			width = 128,
			height = 128,
			frame_count = 1,
			direction_count = 1,
			shift = util.by_pixel(0, 0),
			scale = 0.5,
		},
	},
	{
		type = "corpse",
		name = "diesel-barreling-machine-remnants",
		icon = "__barreling_machines__/graphics/barreling_machines/diesel_barreling_machine_icon.png",
		icon_size = 64,
		flags = { "placeable-neutral", "not-on-map" },
		subgroup = "remnants",
		order = "a-a-a",
		selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
		tile_width = 1,
		tile_height = 1,
		selectable_in_game = false,
		time_before_removed = 60 * 60 * 15,
		final_render_layer = "remnants",
		animation = {
			filename = "__barreling_machines__/graphics/barreling_machines/diesel_barreling_machine_remnants.png",
			priority = "extra-high",
			width = 192,
			height = 192,
			frame_count = 1,
			direction_count = 1,
			shift = util.by_pixel(0, 0),
			scale = 0.5,
		},
	},
})

-------------------------------------------------------------------------------
-- ELECTRIC BARRELING MACHINE
-------------------------------------------------------------------------------

data:extend({
	{
		type = "item",
		name = "electric-barreling-machine",
		icon = "__barreling_machines__/graphics/barreling_machines/electric_barreling_machine_icon.png",
		icon_size = 64,
		subgroup = "barreling-machines",
		group = "production",
		order = "z-a[barreling-machine-b]",
		inventory_move_sound = item_sounds.metal_chest_inventory_move,
		pick_sound = item_sounds.metal_chest_inventory_pickup,
		drop_sound = item_sounds.metal_chest_inventory_move,
		place_result = "electric-barreling-machine",
		stack_size = 50,
		weight = 20 * kg,
	},
})

data:extend({
	{
		type = "assembling-machine",
		name = "electric-barreling-machine",
		icon = "__barreling_machines__/graphics/barreling_machines/electric_barreling_machine_icon.png",
		icon_size = 64,
		flags = { "placeable-neutral", "placeable-player", "player-creation" },
		minable = { mining_time = 0.1, result = "electric-barreling-machine" },
		max_health = 300,
		corpse = "electric-barreling-machine-remnants",
		dying_explosion = "iron-chest-explosion",
		selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
		collision_box = { { -0.3, -0.3 }, { 0.3, 0.3 } },
		crafting_categories = { "barreling", "titanium-barreling" },
		crafting_speed = 2,
		energy_source = {
			type = "electric",
			usage_priority = "secondary-input",
			emissions_per_minute = { pollution = 2 },
		},
		energy_usage = "150kW",
		fluid_boxes_off_when_no_fluid_recipe = false,
		fluid_boxes = {
			{
				production_type = "input",
				pipe_picture = electric_barreling_machine_pipes(),
				pipe_covers = pipecoverspictures(),
				volume = 100,
				pipe_connections = {
					{ flow_direction = "input", direction = defines.direction.north, position = { 0, 0 } },
				},
				secondary_draw_orders = { north = -1 },
			},
			{
				production_type = "output",
				pipe_picture = electric_barreling_machine_pipes(),
				pipe_covers = pipecoverspictures(),
				volume = 100,
				pipe_connections = {
					{ flow_direction = "output", direction = defines.direction.south, position = { 0, 0 } },
				},
				secondary_draw_orders = { north = -1 },
			},
		},
		graphics_set = {
			animation = {
				layers = {
					{
						filename = "__barreling_machines__/graphics/barreling_machines/electric_barreling_machine_sheet.png",
						priority = "extra-high",
						width = 192,
						height = 192,
						frame_count = 32,
						line_length = 8,
						lines_per_sheet = 4,
						animation_speed = 5.0,
						shift = util.by_pixel(0, 0),
						scale = 0.5,
					},
					{
						filename = "__barreling_machines__/graphics/barreling_machines/electric_barreling_machine_shadow.png",
						priority = "extra-high",
						width = 192,
						height = 192,
						repeat_count = 32,
						animation_speed = 5.0,
						shift = util.by_pixel(0, 0),
						draw_as_shadow = true,
						scale = 0.5,
					},
				},
			},
		},
	},
})

data:extend({
	{
		type = "recipe",
		name = "electric-barreling-machine",
		enabled = false,
		ingredients = {
			{ type = "item", name = "iron-plate", amount = 10 },
			{ type = "item", name = "iron-gear-wheel", amount = 5 },
			{ type = "item", name = "electronic-circuit", amount = 3 },
			{ type = "item", name = "burner-barreling-machine", amount = 1 },
		},
		results = { { type = "item", name = "electric-barreling-machine", amount = 1 } },
	},
})

-------------------------------------------------------------------------------
-- BURNER BARRELING MACHINE
-------------------------------------------------------------------------------

data:extend({
	{
		type = "item",
		name = "burner-barreling-machine",
		icon = "__barreling_machines__/graphics/barreling_machines/burner_barreling_machine_icon.png",
		icon_size = 64,
		subgroup = "barreling-machines",
		group = "production",
		order = "z-a[barreling-machine-a]",
		inventory_move_sound = item_sounds.metal_chest_inventory_move,
		pick_sound = item_sounds.metal_chest_inventory_pickup,
		drop_sound = item_sounds.metal_chest_inventory_move,
		place_result = "burner-barreling-machine",
		stack_size = 50,
		weight = 20 * kg,
	},
})

data:extend({
	{
		type = "assembling-machine",
		name = "burner-barreling-machine",
		icon = "__barreling_machines__/graphics/barreling_machines/burner_barreling_machine_icon.png",
		icon_size = 64,
		flags = { "placeable-neutral", "placeable-player", "player-creation" },
		minable = { mining_time = 0.1, result = "burner-barreling-machine" },
		max_health = 150,
		corpse = "burner-barreling-machine-remnants",
		dying_explosion = "iron-chest-explosion",
		selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
		collision_box = { { -0.3, -0.3 }, { 0.3, 0.3 } },
		crafting_categories = { "wooden-barreling", "barreling" },
		crafting_speed = 1,
		energy_source = {
			type = "burner",
			fuel_inventory_size = 1,
			emissions_per_minute = { pollution = 3 },
		},
		energy_usage = "90kW",
		fluid_boxes_off_when_no_fluid_recipe = false,
		fluid_boxes = {
			{
				production_type = "input",
				pipe_picture = burner_barreling_machine_pipes(),
				pipe_covers = pipecoverspictures(),
				volume = 100,
				pipe_connections = {
					{ flow_direction = "input", direction = defines.direction.north, position = { 0, 0 } },
				},
				secondary_draw_orders = { north = -1 },
			},
			{
				production_type = "output",
				pipe_picture = burner_barreling_machine_pipes(),
				pipe_covers = pipecoverspictures(),
				volume = 100,
				pipe_connections = {
					{ flow_direction = "output", direction = defines.direction.south, position = { 0, 0 } },
				},
				secondary_draw_orders = { north = -1 },
			},
		},
		graphics_set = {
			animation = {
				layers = {
					{
						filename = "__barreling_machines__/graphics/barreling_machines/burner_barreling_machine_sheet.png",
						priority = "extra-high",
						width = 192,
						height = 192,
						frame_count = 32,
						line_length = 8,
						lines_per_sheet = 4,
						animation_speed = 5.0,
						shift = util.by_pixel(0, 0),
						scale = 0.5,
					},
					{
						filename = "__barreling_machines__/graphics/barreling_machines/burner_barreling_machine_shadow.png",
						priority = "extra-high",
						width = 192,
						height = 192,
						repeat_count = 32,
						animation_speed = 5.0,
						shift = util.by_pixel(0, 0),
						draw_as_shadow = true,
						scale = 0.5,
					},
				},
			},
		},
	},
})

data:extend({
	{
		type = "recipe",
		name = "burner-barreling-machine",
		enabled = false,
		ingredients = {
			{ type = "item", name = "stone-brick", amount = 5 },
			{ type = "item", name = "wood", amount = 3 },
		},
		results = { { type = "item", name = "burner-barreling-machine", amount = 1 } },
	},
})

-------------------------------------------------------------------------------
-- DIESEL BARRELING MACHINE
-------------------------------------------------------------------------------

if mods["diesel_engine"] then
	data:extend({
		{
			type = "item",
			name = "diesel-barreling-machine",
			icon = "__barreling_machines__/graphics/barreling_machines/diesel_barreling_machine_icon.png",
			icon_size = 64,
			subgroup = "barreling-machines",
			group = "production",
			order = "z-a[barreling-machine-c]",
			inventory_move_sound = item_sounds.metal_chest_inventory_move,
			pick_sound = item_sounds.metal_chest_inventory_pickup,
			drop_sound = item_sounds.metal_chest_inventory_move,
			place_result = "diesel-barreling-machine",
			stack_size = 50,
			weight = 20 * kg,
		},
	})

	data:extend({
		{
			type = "assembling-machine",
			name = "diesel-barreling-machine",
			icon = "__barreling_machines__/graphics/barreling_machines/diesel_barreling_machine_icon.png",
			icon_size = 64,
			flags = { "placeable-neutral", "placeable-player", "player-creation" },
			minable = { mining_time = 0.1, result = "diesel-barreling-machine" },
			max_health = 400,
			corpse = "diesel-barreling-machine-remnants",
			dying_explosion = "iron-chest-explosion",
			selection_box = { { -0.5, -0.5 }, { 0.5, 0.5 } },
			collision_box = { { -0.3, -0.3 }, { 0.3, 0.3 } },
			crafting_categories = { "wooden-barreling", "barreling", "titanium-barreling" },
			crafting_speed = 4,
			diesel_fuel_fluid_filter = true,
			fluid_boxes_off_when_no_fluid_recipe = false,
			energy_source = {
				type = "fluid",
				burns_fluid = true,
				scale_fluid_usage = true,
				fluid_box = {
					pipe_covers = pipecoverspictures(),
					pipe_picture = diesel_barreling_machine_pipes(),
					volume = 10,
					pipe_connections = {
						{ direction = defines.direction.west, position = { 0, 0 } },
						{ direction = defines.direction.east, position = { 0, 0 } },
					},
					production_type = "input-output",
				},
				smoke = {
					{
						name = "smoke",
						frequency = 5,
						position = { 0, 0 },
						starting_vertical_speed = 0.1,
						starting_frame_deviation = 60,
					},
				},
				emissions_per_minute = { pollution = 1 },
			},
			energy_usage = "250kW",
			fluid_boxes = {
				{
					production_type = "input",
					pipe_picture = diesel_barreling_machine_pipes(),
					pipe_covers = pipecoverspictures(),
					volume = 100,
					pipe_connections = {
						{ flow_direction = "input", direction = defines.direction.north, position = { 0, 0 } },
					},
					secondary_draw_orders = { north = -1 },
				},
				{
					production_type = "output",
					pipe_picture = diesel_barreling_machine_pipes(),
					pipe_covers = pipecoverspictures(),
					volume = 100,
					pipe_connections = {
						{ flow_direction = "output", direction = defines.direction.south, position = { 0, 0 } },
					},
					secondary_draw_orders = { north = -1 },
				},
			},
			graphics_set = {
				animation = {
					layers = {
						{
							filename = "__barreling_machines__/graphics/barreling_machines/diesel_barreling_machine_sheet.png",
							priority = "extra-high",
							width = 192,
							height = 192,
							frame_count = 32,
							line_length = 8,
							lines_per_sheet = 4,
							animation_speed = 5.0,
							shift = util.by_pixel(0, 0),
							scale = 0.5,
						},
						{
							filename = "__barreling_machines__/graphics/barreling_machines/diesel_barreling_machine_shadow.png",
							priority = "extra-high",
							width = 192,
							height = 192,
							repeat_count = 32,
							animation_speed = 5.0,
							shift = util.by_pixel(0, 0),
							draw_as_shadow = true,
							scale = 0.5,
						},
					},
				},
			},
		},
	})

	data:extend({
		{
			type = "recipe",
			name = "diesel-barreling-machine",
			enabled = false,
			ingredients = {
				{ type = "item", name = "iron-plate", amount = 10 },
				{ type = "item", name = "steel-gear-wheel", amount = 3 },
				{ type = "item", name = "iron-gear-wheel", amount = 2 },
				{ type = "item", name = "diesel-engine-unit", amount = 1 },
				{ type = "item", name = "burner-barreling-machine", amount = 1 },
			},
			results = { { type = "item", name = "diesel-barreling-machine", amount = 1 } },
		},
	})
	table.insert(
		data.raw["technology"]["diesel-engine"].effects,
		{ type = "unlock-recipe", recipe = "diesel-barreling-machine" }
	)
end
