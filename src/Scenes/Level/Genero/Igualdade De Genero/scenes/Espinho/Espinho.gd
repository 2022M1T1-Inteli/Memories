extends Sprite
onready var Global = get_node("/root/VariaveisGlobais")
# quando o corpo tocar o espinho
func _on_Area2D_body_entered(body):
	
	
	#checa se  o corpo do player bateu no espinho e o leva ao começo da cena
	if body.name == "celeste":
		Global.morte +=1
		print(Global.morte)
		get_tree().change_scene("res://Scenes/Level/Genero/Igualdade De Genero/scenes/Principal/Principal.tscn")
