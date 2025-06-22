extends CanvasLayer

@onready var label = $Label

var count := 0 : set = _set_count
var total := 0 : set = _set_total

func _set_count(value):
	count = value
	_update_label()

func _set_total(value):
	total = value
	_update_label()

func _update_label():
	label.text = "Gemas coletadas: %d / %d" % [count, total]

func show_win_message():
	label.text = "Parabéns! Todas as gemas foram coletadas!"
