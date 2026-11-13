extends Control

@export var dialogueUi : DialogueUI
@export var hudUi : HudUi

enum {HUD, DIALOGUE}
var LastState
var CurrentState

func _ready():
	exitDialogue()
	LastState = DIALOGUE
	CurrentState = HUD
	enterHud()

func enter(thisState):
	match CurrentState:
		HUD:
			exitHud()
		DIALOGUE:
			exitDialogue()
	LastState = CurrentState
	CurrentState = thisState
	match CurrentState:
		HUD:
			enterHud()
		DIALOGUE:
			enterDialogue()

func enterLastState():
	enter(LastState)

func enterDialogue():
	dialogueUi.show()

func exitDialogue():
	dialogueUi.hide()

func enterHud():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	get_tree().paused = false
	hudUi.show()

func exitHud():
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED
	get_tree().paused = true
	hudUi.hide()
