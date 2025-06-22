# Arquivo: Main.gd
extends Node2D

@onready var hud = $HUD
@onready var player = $Player
@onready var item_scene = preload("res://scenes/Item.tscn")

var total_items := 5

func _ready():
	for i in total_items:
		spawn_item()

func spawn_item():
	var item = item_scene.instantiate()
	item.position = Vector2(randi_range(50, 400), randi_range(50, 300))
	item.connect("collected", Callable(self, "_on_item_collected"))
	add_child(item)

func _on_item_collected():
	hud.count += 1
	if hud.count == total_items:
		hud.show_win_message()
