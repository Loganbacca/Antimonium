/datum/material/metal
	general_name = "metal"
	melting_point = 1800
	boiling_point = 3200
	colour = PALE_GREY
	solid_icon = 'icons/objects/items/alchemy/solid_metal_iron.dmi'
	powder_icon = 'icons/objects/items/alchemy/powder_grey.dmi'
	construction_sound = 'sounds/effects/ding1.ogg'
	crafting_recipe_paths = list(
		/datum/crafting_recipe/forging,
		/datum/crafting_recipe/forging/axe,
		/datum/crafting_recipe/forging/hammer,
		/datum/crafting_recipe/forging/mallet,
		/datum/crafting_recipe/forging/construction_hammer,
		/datum/crafting_recipe/forging/horseshoe,
		/datum/crafting_recipe/forging/handsaw,
		/datum/crafting_recipe/forging/level,
		/datum/crafting_recipe/forging/chisel,
		/datum/crafting_recipe/forging/pipe,
		/datum/crafting_recipe/forging/shovel,
		/datum/crafting_recipe/forging/pickaxe,
		/datum/crafting_recipe/forging/needle
		)

/datum/material/metal/GetBuildableStructures(var/obj/item/stack/building_with)
	return list(
		/obj/structure/brazier,
		/obj/structure/sconce,
		/obj/structure/still,
		/obj/structure/stake,
		/obj/structure/anvil,
		/obj/structure/gearbox
		)

/datum/material/metal/iron
	general_name = "iron"
	sharpness_modifier = 2
	weight_modifier = 2

/datum/material/metal/iron/GetBuildableTurfs(var/obj/item/stack/building_with)
	return list()

/datum/material/metal/copper
	general_name = "copper"
	sharpness_modifier = 1.5
	weight_modifier = 1.2
	colour = BRIGHT_ORANGE
	solid_icon = 'icons/objects/items/alchemy/solid_metal_copper.dmi'
	powder_icon = 'icons/objects/items/alchemy/powder_orange.dmi'
	melting_point = 1360
	boiling_point = 2800

/datum/material/metal/copper/GetBuildableTurfs(var/obj/item/stack/building_with)
	return list()

/datum/material/metal/lead
	general_name = "lead"
	weight_modifier = 8
	sharpness_modifier = 0.4
	melting_point = 600
	boiling_point = 2000
	colour = DARK_GREY
	powder_icon = 'icons/objects/items/alchemy/powder_blue.dmi'

/datum/material/metal/gold
	general_name = "gold"
	weight_modifier = 7
	sharpness_modifier = 0.1
	melting_point = 1300
	boiling_point = 3000
	colour = BRIGHT_ORANGE
	solid_icon = 'icons/objects/items/alchemy/solid_metal_gold.dmi'
	powder_icon = 'icons/objects/items/alchemy/powder_orange.dmi'

/datum/material/metal/antimonium
	general_name = "antimonium"
	sharpness_modifier = 1
	weight_modifier = 4
	melting_point = 900
	boiling_point = 1800
	colour = PALE_BLUE
	solid_icon = 'icons/objects/items/alchemy/solid_metal_silver.dmi'
