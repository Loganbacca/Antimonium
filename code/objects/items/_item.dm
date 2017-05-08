/obj/item
	name = "item"
	icon_state = "world"
	icon = 'icons/objects/items/_default.dmi'
	var/slot_flags = 0

/obj/item/proc/use(var/mob/user)
	return

/obj/item/proc/get_worn_icon(var/inventory_slot)
	return image(icon = icon, icon_state = inventory_slot)

/obj/item/proc/get_prone_worn_icon(var/inventory_slot)
	return image(icon = icon, icon_state = "prone_[inventory_slot]")

/obj/item/proc/get_inv_icon()
	return get_worn_icon("held")

/obj/item/handle_clicked_on(var/mob/clicker, var/slot)
	if(is_adjacent_to(get_turf(src), get_turf(clicker)))
		if(!clicker.get_equipped(slot))
			notify_nearby("\The [clicker] picks up \the [src].")
			clicker.collect_item(src, slot)
			return
	. = ..()

/obj/item/proc/attacking(var/mob/user, var/mob/target)
	user.notify_nearby("\The [user] bonks \the [target] over the head with \the [src].")

/obj/item/proc/attacking_self(var/mob/user)
	user.notify_nearby("\The [user] scratches \his back with \the [src].")

/obj/item/attacked_by(var/mob/user, var/obj/item/thing)
	user.notify_nearby("\The [user] pokes \the [src] with \the [thing].")
