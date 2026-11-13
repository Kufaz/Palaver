extends Interactable

@export var dialogueScript : DialogueScript
var skipNextInteraction = false

func interact(interactor = null):
	#TODO: this technically breaks if the player holds
	#down the interect button then moves away from the speaker.
	if skipNextInteraction:
		skipNextInteraction = false
		return
	if dialogueScript:
		skipNextInteraction = true
		UiCanvas.enter(UiCanvas.DIALOGUE)
		UiCanvas.dialogueUi.displayScript(dialogueScript)
