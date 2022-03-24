extends RichTextLabel

var filhos = self.get_parent()

onready var btn1 = $"../Previous"
onready var btn2 = $"../Next"

func _ready():
	btn1.connect("pressed", self, "_on_Previous_pressed")
	btn2.connect("pressed", self, "_on_Next_pressed")

#volta a pagina ao apertar o botão
func _on_Previous_pressed():
	self.get_parent().volta_pagina()
	
#vira a pagina ao apertar o botão
func _on_Next_pressed():
	self.get_parent().vira_pagina()

