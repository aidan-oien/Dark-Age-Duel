extends MarginContainer

const mainMap = preload("res://src/Levels/TestLevel.tscn")

#References to the three selectors
onready var selectorOne = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer/HBoxContainer/Selector
onready var selectorTwo = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer2/HBoxContainer/Selector
onready var selectorThree = $CenterContainer/VBoxContainer/CenterContainer2/VBoxContainer/CenterContainer3/HBoxContainer/Selector

var currentSelection = 0

func _ready():
	setCurrentSelection(0)

#number changes for the ">" to change locations
func _process(delta):
	if (Input.is_action_just_pressed("ui_down") and currentSelection < 2):
		currentSelection += 1
		setCurrentSelection(currentSelection)
	if (Input.is_action_just_pressed("ui_up") and currentSelection > 0):
		currentSelection -= 1
		setCurrentSelection(currentSelection)
	elif (Input.is_action_just_pressed("ui_accept")):
		sceneChooser(currentSelection)

#Code for changing scenes when player chooses an option
func sceneChooser(currentSelection):
	if (currentSelection == 0):
		get_parent().add_child(mainMap.instance())
		queue_free()
	elif (currentSelection == 1):
		print("Not Implemented Yet :)")
	elif (currentSelection == 2):
		get_tree().quit()

#numbers for the location of ">"
func setCurrentSelection(currentSelection):
	selectorOne.text = " "
	selectorTwo.text = " "
	selectorThree.text = " "
	
	if (currentSelection == 0):
		selectorOne.text = ">"
	elif (currentSelection == 1):
		selectorTwo.text = ">"
	elif (currentSelection == 2):
		selectorThree.text = ">"
