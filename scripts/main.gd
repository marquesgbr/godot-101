extends Node2D

@onready var hud = $HUD
@onready var player = $Player
@onready var item_scene = preload("res://scenes/Item.tscn")

var total_items := 0
var collected_count := 0

func _ready():
	randomize()
	total_items = randi_range(10, 35)
	print("Total de gemas: ", total_items)
	hud.total = total_items
	hud.count = 0
	
	for i in range(total_items):
		spawn_item()

func spawn_item():
	var item = item_scene.instantiate()
	var safe_margin = 200  # margem longe do player
	
	item.position = Vector2(
		randf_range(safe_margin, 1280 - safe_margin),
		randf_range(safe_margin, 720 - safe_margin)
	)
	add_child(item)
	item.connect("collected", Callable(self, "_on_item_collected"))

func _on_item_collected():
	collected_count += 1
	hud.count = collected_count
	if collected_count >= total_items:
		hud.show_win_message()
