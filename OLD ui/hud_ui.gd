extends Control
class_name HudUi

@export var emberBar : ProgressBar
@export var solidEmberLable : RichTextLabel

func setEmberBarMax(thisValue : float):
	emberBar.max_value = thisValue

func setEmberBarValue(thisValue : float):
	emberBar.value = thisValue

func setSolidEmber(thisValue : float):
	solidEmberLable.text = str(round(thisValue))
