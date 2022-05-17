extends Area2D

var cont = 0
onready var Global = get_node("/root/VariaveisGlobais")

#botão definido
func _ready():
	connect("body_entered", self, "entrou")

#verificar se jogador passou pelo botão
func entrou(event):
	if event.get_name() == "Jogador":
		get_tree().reload_current_scene()

#recarregar a cena
func _on_Button_pressed():
	if Global.dialogo == "cadeirante":
		Global.para_dialogo = 16
	if Global.dialogo == "homemNegro":
		Global.para_dialogo = 21
	if Global.dialogo == "genero":
		Global.para_dialogo = 0
	Global.add_dialogo = true
	Global.venceu_racial = true
	get_tree().change_scene("res://Scenes/World/World.tscn")
