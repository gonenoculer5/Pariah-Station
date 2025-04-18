/datum/preference/toggle/master_erp_preferences
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	savefile_key = "master_erp_pref"
	savefile_identifier = PREFERENCE_PLAYER
	default_value = TRUE

/datum/preference/choiced/erp_status
	category = PREFERENCE_CATEGORY_NON_CONTEXTUAL
	savefile_identifier = PREFERENCE_CHARACTER
	savefile_key = "erp_status_pref"

/datum/preference/choiced/erp_status/init_possible_values()
	return list("Yes", "Check OOC", "No")

/datum/preference/choiced/erp_status/create_default_value()
	return "No"

/datum/preference/choiced/erp_status/is_accessible(datum/preferences/preferences)
	if (!..(preferences))
		return FALSE

	return preferences.read_preference(/datum/preference/toggle/master_erp_preferences)

/datum/preference/choiced/erp_status/deserialize(input, datum/preferences/preferences)
	if(!preferences.read_preference(/datum/preference/toggle/master_erp_preferences))
		return "No"
	. = ..()

/datum/preference/choiced/erp_status/apply_to_human(mob/living/carbon/human/target, value, datum/preferences/preferences)
	return FALSE
