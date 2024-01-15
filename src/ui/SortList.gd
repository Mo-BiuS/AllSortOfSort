extends VBoxContainer

signal sortSelected(str:String)

func _ready():
	var grp = ButtonGroup.new()
	for i in get_children():
		if i is Button:
			i.button_group = grp;
			i.connect("pressed",buttonPressed.bind(i))
			i.toggle_mode = true;
			i.button_pressed = false
	get_children()[0].button_pressed = true
	buttonPressed(get_children()[0])
	

func buttonPressed(arg:Button):
	sortSelected.emit(arg.text)
