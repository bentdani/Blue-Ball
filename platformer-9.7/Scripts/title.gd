extends Node2D

var choose_gravity = preload("res://Scenes/choose_gravity.tscn")

func _on_button_button_down() -> void:
	Audio.blipPlay()
	get_parent().add_child(choose_gravity.instantiate())
	queue_free()
