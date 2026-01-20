extends Node2D

var gameOver = load("res://Scenes/gameover.tscn")

func _on_area_2d_body_entered(body: Node2D) -> void:
	$Timer.start()
	Stats.winner = "You Lose!"

func _on_timer_timeout() -> void:
	# Wait before triggering the win once the player has touched the flag
	get_parent().add_child(gameOver.instantiate())
	queue_free()

func _ready() -> void:
	$UI/Label.text = str(20)

func _on_timer_2_timeout() -> void:
	var labelint = int($UI/Label.text)
	if $UI/Label.text == "0":
		Stats.winner = "You Lose!"
		get_parent().add_child(gameOver.instantiate())
		queue_free()
	else:
		labelint -= 1
		$UI/Label.text = str(labelint)


func _on_area_2d_2_body_entered(body: Node2D) -> void:
	Stats.winner = "You Win!"
	get_parent().add_child(gameOver.instantiate())
	queue_free()
