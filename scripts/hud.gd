extends CanvasLayer

@onready var label = $Label

var count := 0 : set = _set_count

func _set_count(value):
	count = value
	label.text = "Gemas coletadas: %d" % count

func show_win_message():
	label.text = "Parabéns! Todos as gemas foram coletadas!"
