extends VBoxContainer

signal sortSelected(str:String)

func _ready():
	var grp = ButtonGroup.new()
	for i in get_children():
		if i is Button:
			i.button_group = grp;
			i.connect("pressed",buttonPressed.bind(i))

func buttonPressed(arg:Button):
	sortSelected.emit(arg.text)
