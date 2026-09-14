extends Area2D

var checkpoint_manager

func _ready():
	checkpoint_manager = get_parent().get_parent().get_node("Checkpointmanager")





func _on_body_entered(body: Node2D) -> void:
	if body.name == "PLAYER":
		checkpoint_manager.last_location = $Marker2D.global_position
