/obj/item/fcskill
	name = "Field Commander's Diploma"
	desc = "The diploma of the NTF Field Commander; showing the batchelors in which they specialised and achieved a degree in at the university of Phantom City."
	icon = 'icons/obj/wizard.dmi'
	icon_state = "scrollstamp"

/obj/item/fcskill/attack_self(mob/user)
	. = ..()
	if(istype(user.mind.assigned_role, /datum/job/terragov/command/fieldcommander))
		if(user.mind.skillbookused)
			to_chat(user, span_warning("You've already used a skill book this operation."))
			return
		var/choice = tgui_input_list(user, "What did I get my degree in?", "Field Commander Specialisation.", list("Engineering", "Surgery"))
		switch(choice)
			if("Engineering")
				user.skills.engineer += 1
			if("Surgery")
				user.skills.surgery += 1
			if(null)
				to_chat(user, span_warning("You decide to remember later."))
				return
		user.mind.skillbookused = TRUE



