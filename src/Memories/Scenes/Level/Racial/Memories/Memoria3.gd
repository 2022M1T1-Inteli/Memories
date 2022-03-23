extends Area2D

func _ready():
#	conectar botão
	connect("body_entered", self, "entrou")

func entrou(event):
#	fazer o item sumir quando o jogador passar por ele
	if event.get_name() == "Jogador":
#		bateu()
		queue_free()
		
#		abrir cena do diálogo quando a terceira memória for coletada
		get_tree().change_scene("res://Scenes/World/World.tscn")	
