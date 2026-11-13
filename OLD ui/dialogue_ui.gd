extends Control
class_name DialogueUI

@export var text : AnimatedText
@export var speakerImage : TextureRect
@export var continueIcon : Node
@export var endIcon : Node

var dialogueScript : DialogueScript

const supressInputTime : float = 2.0
var supressInputTimeRemaining : float = 0.0

func _ready():
	text.done_typing.connect(doneTyping)

func _process(delta):
	if supressInputTimeRemaining > 0.0:
		supressInputTimeRemaining -= delta

func _input(event):
	if supressInputTimeRemaining > 0.0 and visible:
		if event.is_action_pressed("ui_accept"):
			if text.is_typing:
				text.skip_typing()
			elif dialogueScript.canContinue():
				displayScript(dialogueScript)
			else:
				UiCanvas.enterLastState()
		if event.is_action_pressed("ui_cancel"):
			UiCanvas.enterLastState()

func doneTyping():
	if dialogueScript.canContinue():
		showContinueIcon()
	else:
		showEndIcon()

func exitDialogue():
	UiCanvas.enter(UiCanvas.HUD)

func showContinueIcon():
	continueIcon.show()

func hideContinueIcon():
	continueIcon.hide()
	
func showEndIcon():
	endIcon.show()

func hideEndIcon():
	endIcon.hide()

func displayScript(thisDialogueScript : DialogueScript):
	supressInputTimeRemaining = supressInputTime
	hideEndIcon()
	hideContinueIcon()
	dialogueScript = thisDialogueScript
	speakerImage.hide()
	if dialogueScript.speakerImage:
		speakerImage.show()
		speakerImage.texture = dialogueScript.speakerImage
		
	text.text = dialogueScript.getNextText()
	text.type_text()
