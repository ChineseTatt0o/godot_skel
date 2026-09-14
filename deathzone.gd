extends Area2D

var player
var checkpoint_manager

func _ready():
	player = get_parent().get_parent().get_node("PLAYER")
	checkpoint_manager = get_parent().get_parent().get_node("Checkpointmanager")

func _on_body_entered(body: Node2D) -> void:
	if body.name == "PLAYER":
		kill_player()
		
func kill_player():
	player.global_position = checkpoint_manager.last_location
