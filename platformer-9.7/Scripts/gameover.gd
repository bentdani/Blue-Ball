extends Node2D

var game = load("res://Scenes/game.tscn")

func _ready() -> void:
	$Control/Label.text = Stats.winner

func _on_button_button_down() -> void:
	Audio.blipPlay()
	get_parent().add_child(game.instantiate())
	queue_free()
	


func _on_button_2_button_down() -> void:
	Audio.blipPlay()
	$Timer.start()


func _on_timer_timeout() -> void:
	get_tree().quit()
