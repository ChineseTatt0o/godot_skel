extends Area2D


var hud


func _ready() :
	hud = get_node("../HUD")
	var default = $AnimatedSprite2D
	default.play("default")


func _on_body_entered(body: Node2D) -> void:
	if body.name == "PLAYER":
		hud.score += 50
		queue_free()
