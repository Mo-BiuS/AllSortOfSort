extends SpinBox

signal addNumber(val:int)

func _on_random_pressed():
	value = randi_range(-99,99)
	
func _on_add_number_pressed():
	addNumber.emit(value)
