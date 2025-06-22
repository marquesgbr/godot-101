# Arquivo: HUD.gd
extends CanvasLayer

@onready var label = $Label

var count := 0 : set = _set_count

func _set_count(value):
	count = value
	label.text = "Itens coletados: %d" % count

func show_win_message():
	label.text = "Parabéns! Todos os itens foram coletados!"
