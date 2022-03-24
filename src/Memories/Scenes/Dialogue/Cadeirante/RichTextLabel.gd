extends RichTextLabel

var filhos = self.get_parent()

onready var btn1 = $"../Previous"
onready var btn2 = $"../Next"

func _ready():
	
	# conecta o aperto dos botões com o richtextlabel
	btn1.connect("pressed", self, "_on_Previous_pressed")
	btn2.connect("pressed", self, "_on_Next_pressed")

# quando o botão previous for apertado volta a pagina
func _on_Previous_pressed():
	self.get_parent().volta_pagina()
	
	#quando o botão next for apertado vira a pagina
func _on_Next_pressed():
	self.get_parent().vira_pagina()

