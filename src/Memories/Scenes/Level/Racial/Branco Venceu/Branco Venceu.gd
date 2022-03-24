extends Node2D
var cont = 0

func _physics_process(delta):
	cont += 1
	if cont == 300:
		get_tree().change_scene("res://Scenes/Level/Racial/World/Mundo.tscn")
