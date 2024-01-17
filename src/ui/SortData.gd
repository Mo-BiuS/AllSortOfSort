extends VBoxContainer

@onready var cBest:Label = $GridContainer/cBest
@onready var cMedium:Label = $GridContainer/cMedium
@onready var cWorst:Label = $GridContainer/cWorst
@onready var cMem:Label = $GridContainer/cMem
@onready var stable:Label = $GridContainer/Stable
@onready var title:Label = $title
@onready var startButton:Button = $"../../../../../../../InputCanvas/VBoxContainer/PanelContainer2/MarginContainer/StartButton"

func _on_sort_list_sort_selected(str:String):
	title.text = str
	match str:
		"Introsort":
			cBest.text = ": n log n"
			cMedium.text = ": n log n"
			cWorst.text = ": n log n"
			cMem.text = ": log n"
			stable.text = ": non"
			startButton.implemented(false)
		"Smoothsort":
			cBest.text = ": n"
			cMedium.text = ": n log n"
			cWorst.text = ": n log n"
			cMem.text = ": 1"
			stable.text = ": non"
			startButton.implemented(false)
		"Timsort":
			cBest.text = ": n"
			cMedium.text = ": n log n"
			cWorst.text = ": n log n"
			cMem.text = ": n"
			stable.text = ": oui"
			startButton.implemented(false)
		"Tri à bulles":
			cBest.text = ": n"
			cMedium.text = ": n^2"
			cWorst.text = ": n^2"
			cMem.text = ": 1"
			stable.text = ": oui"
			startButton.implemented(true)
		"Tri à peigne":
			cBest.text = ": n"
			cMedium.text = ": n log n"
			cWorst.text = ": n^2"
			cMem.text = ": 1"
			stable.text = ": non"
			startButton.implemented(false)
		"Tri arborescent":
			cBest.text = ": n log n"
			cMedium.text = ": n log n"
			cWorst.text = ": n log n"
			cMem.text = ": n"
			stable.text = ": oui"
			startButton.implemented(false)
		"Tri cocktail":
			cBest.text = ": n"
			cMedium.text = ": n^2"
			cWorst.text = ": n^2"
			cMem.text = ": 1"
			stable.text = ": oui"
			startButton.implemented(true)
		"Tri de Shell":
			cBest.text = ": n"
			cMedium.text = ": n log^2 n"
			cWorst.text = ": n log^2 n"
			cMem.text = ": 1"
			stable.text = ": non"
			startButton.implemented(false)
		"Tri fusion":
			cBest.text = ": n log n"
			cMedium.text = ": n log n"
			cWorst.text = ": n log n"
			cMem.text = ": n"
			stable.text = ": oui"
			startButton.implemented(false)
		"Tri pair-impair":
			cBest.text = ": n"
			cMedium.text = ": n^2"
			cWorst.text = ": n^2"
			cMem.text = ": 1"
			stable.text = ": oui"
			startButton.implemented(false)
		"Tri par insertion":
			cBest.text = ": n"
			cMedium.text = ": n^2"
			cWorst.text = ": n^2"
			cMem.text = ": 1"
			stable.text = ": oui"
			startButton.implemented(false)
		"Tri par selection":
			cBest.text = ": n^2"
			cMedium.text = ": n^2"
			cWorst.text = ": n^2"
			cMem.text = ": 1"
			stable.text = ": non"
			startButton.implemented(false)
		"Tri par tas":
			cBest.text = ": n log n"
			cMedium.text = ": n log n"
			cWorst.text = ": n log n"
			cMem.text = ": 1"
			stable.text = ": non"
			startButton.implemented(false)
		"Tri rapide":
			cBest.text = 	": n log n"
			cMedium.text = 	": n log n"
			cWorst.text = 	": n^2"
			cMem.text = 	": log n"
			stable.text = ": non"
			startButton.implemented(false)
		_:
			cBest.text = ": ???"
			cMedium.text = ": ???"
			cWorst.text = ": ???"
			cMem.text = ": ???"
			stable.text = ": ???"
			startButton.implemented(false)
