extends Node2D

@onready var addNumber:Button = $InputCanvas/VBoxContainer/PanelContainer/MarginContainer/HBoxContainer/addNumber
@onready var fillRandom:Button = $InputCanvas/VBoxContainer/PanelContainer3/MarginContainer/HBoxContainer/fillRandom
@onready var arrayArea:ArrayArea = $Solver/ArrayArea
@onready var solver:Control = $Solver

@onready var solveCanvas = $SortCanvas
@onready var inputCanvas = $InputCanvas

var MAX_SIZE:int = 8;
var selectedSort:String = ""
var solving:bool = false

func _process(delta):
	if solving : 
		solver.solve(delta)

func _on_number_select_add_number(val):
	arrayArea.addNumber(val)
	if(arrayArea.getSize() >= 8):
		addNumber.disabled = true
		fillRandom.disabled = true

func _on_scramble_data_pressed():
	arrayArea.shuffle()

func _on_fill_random_pressed():
	while(arrayArea.getSize() < MAX_SIZE):
		_on_number_select_add_number(randi_range(-99,99))

func _on_clear_pressed():
	arrayArea.clear()
	addNumber.disabled = false
	fillRandom.disabled = false

func _on_start_button_pressed():
	print("start : "+selectedSort)
	solver.set_script(load("res://src/script/"+selectedSort+".gd"))
	solver.mainArray = arrayArea
	solver.main = self
	
	arrayArea.setSpeed(0.5)
	solveCanvas.hide()
	inputCanvas.hide()
	solving = true

func done():
	arrayArea.setSpeed(1)
	solveCanvas.show()
	inputCanvas.show()
	solver.set_script(null)
	solving = false

func _on_sort_list_sort_selected(str):
	selectedSort = str;
