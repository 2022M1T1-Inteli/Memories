extends Node2D
onready var Global = get_node("/root/VariaveisGlobais")

func _on_Next_pressed():
	
	#impede o tutorial de se repitir
	Global.ja_viu_tutorial = true
	
	#troca a cena
	get_tree().change_scene("res://Scenes/World/World.tscn")

