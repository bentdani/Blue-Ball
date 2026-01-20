extends Node2D

var gameOver = load("res://Scenes/gameover.tscn")
var time_left = 20

func _on_area_2d_body_entered(body: Node2D) -> void:
	$Timer.start()
	Stats.winner = "You Lose!"

func _on_timer_timeout() -> void:
	# Wait before triggering the win once the player has touched the flag
	get_parent().add_child(gameOver.instantiate())
	queue_free()

func update_time(time: float) -> void:
	$UI/Label.text = "Time Left: " + str(round(time * 10) / 10 ) + "s"

func _ready() -> void:
	# init the displayed time
	update_time(time_left)

func _on_timer_2_timeout() -> void:
	# triggers once a second
	time_left -= 0.1
	update_time(time_left)
	
	# check if we have time left
	if time_left <= 0:
		Stats.winner = "You Lose!"
		get_parent().add_child(gameOver.instantiate())
		queue_free()


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	# hit the flag
	Stats.winner = "You Win!"
	get_parent().add_child(gameOver.instantiate())
	queue_free()
