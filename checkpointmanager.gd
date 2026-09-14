extends Node2D

var last_location
@onready var player = $"../PLAYER"

func _ready():
	last_location = player.global_position
