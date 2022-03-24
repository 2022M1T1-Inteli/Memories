extends Sprite




func _on_Area2D_body_entered(body):
	if body.name == "celeste":
		get_tree().change_scene("res://scenes/principal/Principal.tscn")
