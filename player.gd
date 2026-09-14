extends CharacterBody2D


const SPEED = 1200.0
const JUMP_VELOCITY = -2000.0
const GRAVITY_MULTIPLIER = 2.5
var jump_count = 0
@onready var animatedSprite = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * GRAVITY_MULTIPLIER * delta
	else:
		jump_count = 0
	#jump set.
	if Input.is_action_just_pressed("ui_accept") and jump_count < 2:
		jump_count += 1
		velocity.y = JUMP_VELOCITY
		if jump_count == 2:
			
			animatedSprite.play("wings")
			await get_tree().create_timer(0.7).timeout
			animatedSprite.play("run")
		

	#movement set.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	
	if direction:
		if is_on_floor():
			animatedSprite.play("run")
		animatedSprite.flip_h = direction < 0
		velocity.x = direction * SPEED
	else:
		if is_on_floor():
			animatedSprite.play("idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
