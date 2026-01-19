extends CharacterBody2D

var acceleration = 2000.0
var friction = 2.0
var max_speed = 150.0
const JUMP_VELOCITY = -300.0


func _physics_process(delta: float) -> void:
	# Read the gravity from the Stats
	var gravity = Stats.gravity
	
	# Add the gravity. (Positive gravity is "down" direction)
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("Up") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Left", "Right")
	if direction != 0:
		# Gradually increase velocity
		velocity.x = move_toward(velocity.x, direction * max_speed, acceleration * delta)
	else:
		# Gradually decrease velocity with friction
		# Scale friction based on gravity strength
		velocity.x = move_toward(velocity.x, 0, (friction * gravity) * delta)

	move_and_slide()
