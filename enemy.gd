extends CharacterBody2D

var SPEED = 1195.0

@onready var player = $"../PLAYER"
var follow


func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity()*delta
	if follow:
		if player.global_position.x < global_position.x:
			velocity.x = -SPEED
		elif player.global_position.x > global_position.x:
			velocity.x = SPEED
	move_and_slide()

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "PLAYER":
		follow = true
		print("player entered")


func _on_area_2d_body_exited(body: Node2D) -> void:
	if body.name == "PLAYER":
		follow = false
		print("player left")
