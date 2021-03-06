/mob
	density = 1
	icon = 'icons/mobs/_default.dmi'
	layer = MOB_LAYER
	see_invisible = SEE_INVISIBLE_LIVING
	draw_shadow_underlay = TRUE
	sight = SEE_SELF|SEE_BLACKNESS

	var/weight = 50
	var/burn_point = TEMPERATURE_BURNING
	var/blood_material = /datum/material/water/blood

/mob/Grind()
	Gib()

/mob/proc/Gib()
	Splatter(loc, blood_material)
	while(limbs.len > 1)
		var/obj/item/limb/limb = limbs[pick(limbs - BP_CHEST)]
		limb.SeverLimb()
		sleep(-1)
	QDel(src)

/mob/proc/GetSlotByHandedness(var/handedness)
	return null

/mob/GetWeight()
	return weight

/mob/Initialize()

	mob_list += src
	if(dead)
		dead_mob_list += src
	else
		living_mob_list += src

	// Instantiate body.
	CreateLimbs()

	// Update temperature flags.
	if(heat_suffer_point != TEMPERATURE_NEVER_HOT || \
	 heat_harm_point != TEMPERATURE_NEVER_HOT || \
	 cold_suffer_point != TEMPERATURE_NEVER_COLD || \
	 cold_harm_point != TEMPERATURE_NEVER_COLD)
		flags |= FLAG_TEMPERATURE_SENSITIVE

	// Update speech categories.
	can_understand_speech |= understand_category

	// Create default UI.
	CreateUI()

	..()

/mob/Destroy()
	dead_mob_list -= src
	living_mob_list -= src
	mob_list -= src
	. = ..()

/mob/UpdateStrings()
	..()
	if(key)
		name = key

/mob/FaceAtom()
	if((!prone && !sitting) || dragged)
		. = ..()

/mob/proc/TransferControlTo(var/mob/other)
	if(role)
		role.mob = other
		other.role = role
	other.key = key

/mob/proc/IsDigger(var/complex_digging = FALSE)
	return FALSE

/mob/RandomizePixelOffset()
	return

/mob/EndThrow()
	ResetPosition()

/mob/HandleFireDamage()
	if(fire_intensity >= 100)
		Die("the hungry flames")
		// create ashes
		KillLight()
		QDel(src)
