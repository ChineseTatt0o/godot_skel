extends CharacterBody2D

#CONFIGS OF PHYSICS
const WALK_SPEED = 300.0
const FLOAT_SPEED = 420
const ACCELERATION = 800
const DECELERATION = 1000
#PARAMETERS OF FLOATING
@export var float_amplitude : float = 5 
@export var float_frequency : float = 6
#KNOTS REFERENCES
@onready var visual_pivot = $visualPivot
@onready var body_sprite = $visualPivot/BodycloakPtailll
@onready var legs_sprite =$visualPivot/LegsPtaillll
@onready var particules = $visualPivot/TrailParticules
#INTERN VARIABLES
var time_passed : float = 0
var is_floating : bool = false
var current_speed : float = 0

func _physics_process(delta: float):
	var direction = Input.get_axis("ui_left","ui_right")
	if direction != 0:
		is_floating = true
		current_speed = move_toward(current_speed,FLOAT_SPEED,ACCELERATION*delta)
		velocity.x = direction * current_speed
		visual_pivot.scale.x = abs(visual_pivot.scale.x) * direction
	else:
		is_floating = false
		current_speed = move_toward(current_speed,0.0,DECELERATION*delta)
		velocity.x = current_speed

	move_and_slide()
	handle_dracula_transform(delta,direction)

#VISUALS ND EFFECTS
func handle_dracula_transform(delta:float,direction: float):
	if is_floating:
		time_passed += delta
		var hover_offset = sin(time_passed * float_frequency) * float_amplitude
		visual_pivot.position.y = lerp(visual_pivot.position.y, hover_offset - 8.0, 5.0 * delta)
		legs_sprite.scale.y = lerp(legs_sprite.scale.y, 0.0, 6.0 * delta)
		legs_sprite.modulate.a = lerp(legs_sprite.modulate.a, 0.0, 6.0 * delta)
		body_sprite.scale.y = lerp(body_sprite.scale.y, 1.25, 4.0 * delta)
		particules.emitting = true
	else:
		time_passed = 0.0
		visual_pivot.position.y = lerp(visual_pivot.position.y, 0.0, 5.0 * delta)
		legs_sprite.scale.y = lerp(legs_sprite.scale.y, 1.0, 6.0 * delta)
		legs_sprite.modulate.a = lerp(legs_sprite.modulate.a, 1.0, 6.0 * delta)
		body_sprite.scale.y = lerp(body_sprite.scale.y, 1.0, 4.0 * delta)
		particules.emitting = false
