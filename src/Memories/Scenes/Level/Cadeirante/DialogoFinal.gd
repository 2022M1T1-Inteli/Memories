extends RichTextLabel


var filhos = self.get_parent()

onready var btn1 = $"../Previous"
onready var btn2 = $"../Next"

func _ready():
	btn1.connect("pressed", self, "_on_Previous_pressed")
	btn2.connect("pressed", self, "_on_Next_pressed")


func _on_Previous_pressed():
	print("btn1")
	self.get_parent().volta_pagina()
	
func _on_Next_pressed():
	print("btn2")
	self.get_parent().vira_pagina()
