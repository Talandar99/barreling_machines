-----------------------------------------------------------------------------------------------------------------------
-- barreling category
-----------------------------------------------------------------------------------------------------------------------
for _, fluid in pairs(data.raw.fluid) do
	if data.raw.recipe["empty-" .. fluid.name .. "-barrel"] then
		data.raw.recipe["empty-" .. fluid.name .. "-barrel"].subgroup = "empty-steel-barrel"
		data.raw.recipe["empty-" .. fluid.name .. "-barrel"].factoriopedia_alternative = nil
		if data.raw.recipe["fill-" .. fluid.name .. "-barrel"] then
			data.raw.recipe["fill-" .. fluid.name .. "-barrel"].subgroup = "fill-steel-barrel"
			data.raw.recipe["fill-" .. fluid.name .. "-barrel"].factoriopedia_alternative = nil
		end
		if data.raw.recipe[fluid.name .. "-barrel"] then
			data.raw.recipe[fluid.name .. "-barrel"].subgroup = "fill-steel-barrel"
			data.raw.recipe[fluid.name .. "-barrel"].factoriopedia_alternative = nil
		end
		if data.raw.item[fluid.name .. "-barrel"] then
			data.raw.item[fluid.name .. "-barrel"].subgroup = "fill-steel-barrel"
			data.raw.item[fluid.name .. "-barrel"].factoriopedia_alternative = nil
		end
	end
end

require("prototypes.titanium-barreling")
