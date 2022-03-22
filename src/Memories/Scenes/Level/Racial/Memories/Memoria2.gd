extends Area2D

var bateu = false

func _ready():
#	conectar botão
	connect("body_entered", self, "entrou")

func entrou(event):
#	fazer o item sumir quando o jogador passar por ele
	if event.get_name() == "Jogador":
#		bateu()
		queue_free()
