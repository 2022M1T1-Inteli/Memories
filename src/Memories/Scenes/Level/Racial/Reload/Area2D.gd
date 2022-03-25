extends Area2D

var cont = 0

#botão definido
func _ready():
	connect("body_entered", self, "entrou")

#verificar se jogador passou pelo botão
func entrou(event):
	if event.get_name() == "Jogador":
		get_tree().reload_current_scene()

#recarregar a cena
func _on_Button_pressed():
	get_tree().change_scene("res://Scenes/World/World.tscn")
