extends CharacterBody2D

var gravity = Stats.gravity
var acceleration = 100.0
var friction = 50.0
var max_speed = 200.0
const JUMP_VELOCITY = -300.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction != 0:
		# Gradually increase velocity
		velocity.x = move_toward(velocity.x, direction * max_speed, acceleration * delta)
	else:
		# Gradually decrease velocity
		velocity.x = move_toward(velocity.x, 0, friction * delta)

	move_and_slide()
