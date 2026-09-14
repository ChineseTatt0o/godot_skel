extends Path2D

@onready var animation = $AnimationPlayer
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animation.play("MOVEMENT")
