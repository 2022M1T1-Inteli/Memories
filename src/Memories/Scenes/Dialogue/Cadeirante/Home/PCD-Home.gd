extends Node2D

var pagina=0
#texto da pergunta
var texto=["Fala pra noia amigão","Vou te contar uma história de cadeirante","Senta que la vem história...", "Aceita a missão?"]
var controle = texto.size() - 1

func _ready():
	$pergunta.set_bbcode(texto[0])

func vira_pagina():
	#verifica se atingiu a ultima posição do array
	if(pagina == controle):
<<<<<<< HEAD:src/Memories/Scenes/Dialogue/Cadeirante/PCD-Home.gd
		get_tree().change_scene("res://Scenes/Level/Cadeirante/PCD-World.tscn")
=======
		get_tree().change_scene("res://Scenes/Tasks/PCD-World.tscn")
>>>>>>> 3b9eab2022529a52cbface13f085e35871f00c7e:src/Memories/Scenes/Dialogue/Cadeirante/Home/PCD-Home.gd
	#troca passando para a proxima fala do array texto
	if pagina +1< texto.size():
		pagina +=1
		$pergunta.set_bbcode(texto[pagina])
	
func volta_pagina():
	#troca voltando a antiga fala do array texto (se for a primeira posição, não troca)	
	if pagina != 0:
		pagina -=1
		$pergunta.set_bbcode(texto[pagina])


func _on_Next_pressed():
	get_tree().change_scene("res://Scenes/Tasks/Cadeirante/Task/PCD-World.tscn")


func _on_Previous_pressed():
	get_tree().change_scene("res://Scenes/World/World.tscn")
