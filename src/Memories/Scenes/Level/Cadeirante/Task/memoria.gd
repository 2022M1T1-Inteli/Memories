extends Area2D

var bateu = false

#	conectar botão
func _ready():
	connect("body_entered", self, "entrou")

#	fazer o item sumir quando o jogador passar por ele
func entrou(event):
	if event.get_name() == "Jogador":
		queue_free()
