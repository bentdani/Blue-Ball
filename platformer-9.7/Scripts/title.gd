extends Node2D

var game = preload("res://Scenes/game.tscn")

func _on_button_button_down() -> void:
	Audio.blipPlay()
	get_parent().add_child(game.instantiate())
	queue_free()
