extends RichTextLabel
class_name AnimatedText

signal done_typing

var _is_typing : bool = false
var _typing_speed
var _typing_progress = 0.0

func _process(delta):
	if _is_typing:
		_typing_progress += _typing_speed * delta
		visible_characters = _typing_progress
		if visible_characters >= get_total_character_count():
			_is_typing = false
			done_typing.emit()

func type_text(text_to_type : String = "", speed : float = 64.0):
	_typing_progress = 0.0
	visible_characters = 0
	text = text_to_type
	_typing_speed = speed
	_is_typing = true

func skip_typing():
	if _is_typing:
		_is_typing = false
		visible_characters = get_total_character_count()
		done_typing.emit()
