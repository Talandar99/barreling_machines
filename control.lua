local function assert_entity_is_assembling_machine(name)
	-- We use ONLY the new Factorio 2.0+ syntax
	local proto = prototypes.entity[name]

	-- If the prototype was deleted by another mod, don't crash hard, but write a log or skip
	if not proto then
		log("Barreling Machines: Prototype " .. tostring(name) .. " was removed by another mod. Skipping checks.")
		return
	end

	assert(
		proto.type == "assembling-machine",
		"\n\n[img=utility/warning_icon] Wrong prototype type for "
			.. name
			.. "!"
			.. "\n\nExpected: assembling-machine"
			.. "\nFound: "
			.. tostring(proto.type)
			.. "\n\nA mod has replaced your barreling machine with a different entity type."
			.. "\nThis mod requires "
			.. name
			.. " to remain an assembling-machine. \n\n"
	)
end

local function barreling_machine_sanity_checks()
	assert_entity_is_assembling_machine("burner-barreling-machine")
	assert_entity_is_assembling_machine("electric-barreling-machine")

	if script.active_mods["diesel_machines"] then
		assert_entity_is_assembling_machine("diesel-barreling-machine")
	end
end

local function on_init()
	barreling_machine_sanity_checks()
end
script.on_init(on_init)

local function on_configuration_changed()
	barreling_machine_sanity_checks()
end
script.on_configuration_changed(on_configuration_changed)
