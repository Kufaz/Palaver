extends Resource
class_name DialogueScript

var pointer : int = 0
@export var text : Array[String]
@export var speakerImage : Texture

func getNextText() -> String:
	if !canContinue():
		pointer = 0
	var string = text[pointer]
	pointer += 1
	return string

func canContinue() -> bool:
	if pointer >= text.size():
		return false
	else:
		return true
