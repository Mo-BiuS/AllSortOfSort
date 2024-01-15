extends Node2D

@onready var addNumber:Button = $InputCanvas/VBoxContainer/PanelContainer/MarginContainer/HBoxContainer/addNumber
@onready var fillRandom:Button = $InputCanvas/VBoxContainer/PanelContainer3/MarginContainer/HBoxContainer/fillRandom
@onready var arrayArea = $Draw/ArrayArea
var numberBlock = preload("res://number_block.tscn")

var array:Array = []
var MAX_SIZE:int = 8;

func _on_number_select_add_number(val):
	array.append(val)
	var nb = numberBlock.instantiate()
	nb.val = val
	nb.position = Vector2(arrayArea.size.x/2+5,10)
	arrayArea.add_child(nb)
	if(array.size() >= 8):
		addNumber.disabled = true
		fillRandom.disabled = true

func _on_scramble_data_pressed():
	array = arrayArea.shuffle()
	
func _on_fill_random_pressed():
	while(array.size() < MAX_SIZE):
		_on_number_select_add_number(randi_range(-99,99))

func _on_clear_pressed():
	array.clear()
	arrayArea.clear()
	addNumber.disabled = false
	fillRandom.disabled = false
