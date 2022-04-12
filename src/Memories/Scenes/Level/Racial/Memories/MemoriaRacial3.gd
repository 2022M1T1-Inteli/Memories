extends Area2D

onready var Global = get_node("/root/VariaveisGlobais")

#conectar botão
func _ready():
	connect("body_entered", self, "entrou")
#
#fazer o item sumir e voltar ao mapa inicial
func entrou(event):
	if event.get_name() == "Jogador":
#		queue_free()
		if Global.dialogo == "cadeirante":
			Global.para_dialogo = 16
		if Global.dialogo == "homemNegro":
			Global.para_dialogo = 21
		if Global.dialogo == "genero":
			Global.para_dialogo = 16
		Global.add_dialogo = true
		get_tree().change_scene("res://Scenes/World/World.tscn")
		
