extends Node2D

var pagina=0
#texto da pergunta
var texto=["Stephen Hawking: Olá! Tenho a impressão de que já nos conhecemos, mas por precaução...", "Muito prazer! Me chamo Stephen Hawking, mas pode me chamar de Steph!","Quero te contar mais sobre a minha história, tem interesse?","Mas para isso preciso que você passe por um desafio."]
var controle = texto.size() - 1

func _ready():
	$pergunta.set_bbcode(texto[0])

func vira_pagina():	
	#verifica se atingiu a ultima posição do array
	if(pagina == controle):
		get_tree().change_scene("res://Scenes/Level/Cadeirante/Task/PCD-World.tscn")
	#troca passando para a proxima fala do array texto
	if pagina +1< texto.size():
		pagina +=1
		$pergunta.set_bbcode(texto[pagina])
	
func volta_pagina():
	#troca voltando a antiga fala do array texto (se for a primeira posição, não troca)	
	if pagina != 0:
		pagina -=1
		$pergunta.set_bbcode(texto[pagina])
	if (pagina == 0):
		get_tree().change_scene("res://Scenes/World/World.tscn")	

