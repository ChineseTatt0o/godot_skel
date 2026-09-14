extends RigidBody2D

@export var speed := 1000.0
var player = null

# Called when the node enters the scene tree for the first time.
func _ready():
	var default = $AnimatedSprite2D
	default.play("default")

#func _on_visible_on_screen_notifier_2d_screen_exited():
	#queue_free()

func _on_fieldofv_body_entered(body: Node2D) -> void:
	if body.is_in_group("t"):
		player = body



func _on_fieldofv_body_exited(body: Node2D) -> void:
	if body == player:
		player = null



func _process(delta: float) -> void:
	if player != null :
		var direction = global_position.direction_to(player.global_position)
		linear_velocity = direction * speed
	else:
		linear_velocity = Vector2.ZERO
	
