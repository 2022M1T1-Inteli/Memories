extends Area2D

#botão definido
func _ready():
	connect("body_entered", self, "entrou")
	
#verificar se jogador passou pelo botão e recarregar a cena
func entrou(event):
	if event.get_name() == "Jogador":
		get_tree().reload_current_scene()
