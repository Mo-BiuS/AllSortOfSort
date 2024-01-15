extends Button

func implemented(val:bool):
	if(val):
		text = "start"
		disabled = false
	else :
		text = "Unimplemented"
		disabled = true
