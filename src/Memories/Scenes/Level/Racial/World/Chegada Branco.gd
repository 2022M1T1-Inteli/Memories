extends Area2D

#verificar se jogador passou pelo botão e recarregar a cena
func entrou(event):
	if event.get_name() == "HomemBranco":
		get_tree().change_scene("res://Scenes/Level/Racial/Branco Venceu/Branco Venceu.tscn")
