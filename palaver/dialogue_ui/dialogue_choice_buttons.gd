extends Node
class_name DialogueChoiceButtons

@export var continueGraphic : Control
@export var closeGraphic : Control
@export var choiseButtonTemplate : Button

var _choiseButtons : Array[Button]

func _ready():
	choiseButtonTemplate.hide()
	hideAll()

func hideAll():
	continueGraphic.hide()
	closeGraphic.hide()
	for c in _choiseButtons:
		c.queue_free()
	_choiseButtons.clear()

func spawnChoiceButton(button_lable : String = ""):
	var button : Button = choiseButtonTemplate.duplicate()
	button.text = button_lable
	_choiseButtons.append(button)
	choiseButtonTemplate.get_parent().add_child(button)
