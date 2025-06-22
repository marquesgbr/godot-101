# Arquivo: Player.gd
extends CharacterBody2D

@export var speed := 200.0
@onready var anim = $AnimatedSprite2D

func _physics_process(delta):
	var direction = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	).normalized()
	
	velocity = direction * speed
	move_and_slide()
	if direction != Vector2.ZERO:
		anim.play("run")
	else:
		anim.play("idle")
		
	if direction.x < 0:
		anim.flip_h = true
	elif direction.x > 0:
		anim.flip_h = false
