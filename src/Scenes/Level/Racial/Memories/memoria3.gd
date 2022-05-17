extends Area2D

func _ready():
	pass

	
	#sai da fase quando as memórias foram coletadas
	if Global.mem > 2:
		if Global.dialogo == "cadeirante":
			Global.para_dialogo = 16
		if Global.dialogo == "homemNegro":
			Global.para_dialogo = 21
		if Global.dialogo == "genero":
			Global.para_dialogo = 0
		Global.add_dialogo = true
		get_tree().change_scene("res://Scenes/World/World.tscn")

