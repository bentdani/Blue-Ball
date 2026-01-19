extends Node2D

var game = preload("res://Scenes/game.tscn")


func _on_mars_button_down() -> void:
	Stats.gravity = 373
	Audio.blipPlay()
	get_parent().add_child(game.instantiate())
	queue_free()


func _on_earth_button_down() -> void:
	Stats.gravity = 981
	Audio.blipPlay()
	get_parent().add_child(game.instantiate())
	queue_free()



func _on_moon_button_down() -> void:
	Stats.gravity = 162
	Audio.blipPlay()
	get_parent().add_child(game.instantiate())
	queue_free()
