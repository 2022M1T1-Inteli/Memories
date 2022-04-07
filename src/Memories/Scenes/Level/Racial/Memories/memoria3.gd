extends Area2D


onready var Global = get_node("/root/VariaveisGlobais")

func _ready():
	
	#retira memórias já coletadas
	if Global.mem > 2:
		if Global.dialogo == "cadeirante":
			Global.para_dialogo = 16
		if Global.dialogo == "homemNegro":
			Global.para_dialogo = 21
		if Global.dialogo == "genero":
			Global.para_dialogo = 0
		Global.add_dialogo = true
		get_tree().change_scene("res://Scenes/World/World.tscn")
