extends Node2D
var cont = 0

func _ready():
	$Timer.start()
	
#temporizador do tempo da cena perdeu
func _process(delta):
	if $Timer.time_left == 0:
		get_tree().change_scene("res://Scenes/Level/Racial/World/Mundo.tscn")
