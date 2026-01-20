extends CharacterBody2D

var acceleration = 2500.0
var max_speed = 200.0
const JUMP_VELOCITY = -300.0

var surface_frictions = {
	"ice": 0.1,
	"normal": 2.0
}
var friction = surface_frictions["normal"]


func check_if_on_ice() -> bool:
	# Get the tile position under the player
	var floor_pos = get_parent().get_node("Main").local_to_map(global_position + Vector2(0, 7))
	var data = get_parent().get_node("Main").get_cell_tile_data(floor_pos)
	
	print("data: " + str(data))
	print("floor pos " + str(floor_pos))
	
	if is_on_floor():
		if data:
			return data.get_custom_data("is_ice")
		else:
			push_error("No block data for surface type!")
	return false

func _physics_process(delta: float) -> void:
	if check_if_on_ice():
		friction = surface_frictions["ice"]
		print("ice!")
	else:
		friction = surface_frictions["normal"]
		print("no ice!")
	
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
	if direction:
		velocity.x = move_toward(velocity.x, direction * max_speed, acceleration * delta)
	
	# Gradually decrease velocity with friction
	# Scale friction based on gravity strength
	velocity.x = move_toward(velocity.x, 0, (friction * gravity) * delta)

	move_and_slide()
