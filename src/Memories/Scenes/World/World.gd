extends Node2D

onready var Global = get_node("/root/VariaveisGlobais")

func _ready():
	if Global.add_dialogo == true:
		var cena = load("res://Scenes/Dialogue/Dialogue.tscn").instance()
		add_child(cena)
		get_tree().paused = true
		print("sss")
