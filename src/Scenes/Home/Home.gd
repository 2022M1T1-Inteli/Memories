extends Node2D

onready var Global = get_node("/root/VariaveisGlobais")


func _on_Start_pressed():
	
	#mostra o tutorial se não foi visto
	if Global.ja_viu_tutorial == false:
		get_tree().change_scene("res://Scenes/Mensagem Inicial/Pergaminho.tscn")
		
	else:
		get_tree().change_scene("res://Scenes/World/World.tscn")
	
