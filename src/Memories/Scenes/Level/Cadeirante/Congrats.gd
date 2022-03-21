extends Node2D

var pagina=0
#texto da pergunta
var texto=["Assim como você experimentou agora, eu passei ao longo da minha vida por muitos obstáculos...", "Se algum dia fui uma pessoa comum, por mais de 50 anos eu deixei de ser.","Mas eu segui sendo a mesma pessoa, com toda uma história pessoal, sonhos, desejos, conquistas, amores...","E não, não sou especial e nem nada do tipo.", "Assim como eu, outros pessoas com deficiência são iguais a qualquer outra pessoa que você vê por aí.", "Pessoas com histórias pessoais, sonhos, desejos, conquistas, amores...", "Tenho a sorte de ter sido uma pessoa que conquistou influência mundial, e isso permitiu que eu desse mais visibilidade para outros que vivem uma vida de obstáculos como a que eu vivi. ", "Mas isso não significa que o esforço acabou... ", "A luta contra o preconceito e obstáculos tem que acompanhar um esforço ativo, e todos tem que fazer a parte.", "Principalmente aqueles que tem condições de fazer mais por nós!", "Conto com você!"]
var controle = texto.size() - 1

func _ready():
	$DialogoFinal.set_bbcode(texto[0])

func vira_pagina():	
	#verifica se atingiu a ultima posição do array
	if(pagina == controle):
		get_tree().change_scene("res://Scenes/World/World.tscn")
	#troca passando para a proxima fala do array texto
	if pagina +1< texto.size():
		pagina +=1
		$DialogoFinal.set_bbcode(texto[pagina])
	
func volta_pagina():
	#troca voltando a antiga fala do array texto (se for a primeira posição, não troca)	
	if pagina != 0:
		pagina -=1
		$DialogoFinal.set_bbcode(texto[pagina])
	if (pagina == 0):
		get_tree().change_scene("res://Scenes/World/World.tscn")	
