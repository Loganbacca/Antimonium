/obj/ui/inv
	name = "Inventory"
	var/obj/item/holding
	var/slot_id
	var/slot_flags = 0
	var/unmodified_name
	var/concealable = FALSE
	var/list/update_bodyparts
	var/associated_limb

	var/image/inv_overlay

/obj/ui/inv/MouseDrop(var/atom/over_object,src_location,over_location,src_control,over_control,params)
	if(holding)
		holding.MouseDrop(over_object,src_location,over_location,src_control,over_control,params)

/obj/ui/inv/New(var/mob/_owner, var/nname, var/nscreen_loc, var/nslot_id, var/_slot_flags, var/list/_update_bodyparts, var/_associated_limb)
	. = ..()
	if(nname)
		name = nname
	unmodified_name = name
	if(nscreen_loc)
		screen_loc = nscreen_loc
	if(nslot_id)
		slot_id = nslot_id
	icon_state = "inv_[slot_id]"
	slot_flags |= _slot_flags
	if(concealable) // Defaults to on.
		invisibility = INVISIBILITY_MAXIMUM
	update_bodyparts = _update_bodyparts
	associated_limb = _associated_limb

/obj/ui/inv/Destroy()
	holding = null
	. = ..()

/obj/ui/inv/proc/SetHeld(var/obj/item/thing)
	holding = thing
	UpdateIcon()

/obj/ui/inv/proc/ForgetHeld()
	holding = null
	UpdateIcon()

/obj/ui/inv/UpdateIcon()
	name = unmodified_name

	overlays -= inv_overlay

	inv_overlay = null

	if(holding)
		name = "[name] - [holding.name]"
		inv_overlay = holding.GetInvIcon()
	if(update_bodyparts && update_bodyparts.len)
		for(var/thing in update_bodyparts)
			var/obj/item/limb/limb = owner.limbs[thing]
			if(istype(limb))
				limb.SetNotMoving((holding ? TRUE : FALSE), TRUE)

	overlays += inv_overlay
