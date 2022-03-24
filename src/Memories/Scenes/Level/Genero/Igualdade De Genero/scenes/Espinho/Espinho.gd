extends Sprite

# quando o corpo tocar o espinho
func _on_Area2D_body_entered(body):
	
	#checa se  o corpo do player bateu no espinho e o leva ao começo da cena
	if body.name == "celeste":
		get_tree().change_scene("res://Scenes/Level/Genero/Principal/Principal.tscn")
