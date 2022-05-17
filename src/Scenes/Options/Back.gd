extends Button

func _ready():
	pass # Replace with function body.

func _on_Back_pressed():
	$Click.play()
	yield($Click, "finished")
	get_tree().change_scene("res://Scenes/Home/Home.tscn")
