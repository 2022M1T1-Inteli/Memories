extends Area2D

#conectar botão
func _ready():
	connect("body_entered", self, "entrou")
#
#fazer o item sumir e voltar ao mapa inicial
func entrou(event):
	if event.get_name() == "Jogador":
		queue_free()
		get_tree().change_scene("res://Scenes/World/World.tscn")	
