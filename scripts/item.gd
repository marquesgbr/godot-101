extends Area2D
@onready var shape = $CollisionShape2D.shape # CircleShape2D

signal collected
var velocity = Vector2.ZERO
var radius = 0.0

func _ready():
	$AnimatedSprite2D.play("idle")
	radius = shape.radius
	randomize()
	velocity = Vector2(randf_range(-100, 100), randf_range(-100, 100))
	connect("body_entered", Callable(self, "_on_body_entered"))


func _process(delta):
	position += velocity * delta
	
	var screen_size = get_viewport_rect().size
	
	# Rebater nas bordas 
	if position.x < radius or position.x > screen_size.x - radius:
		velocity.x *= -1
	if position.y < radius or position.y > screen_size.y - radius:
		velocity.y *= -1

func _on_body_entered(body):
	if body.name == "Player":
		emit_signal("collected")
		queue_free()
