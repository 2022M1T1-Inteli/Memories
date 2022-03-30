extends ColorRect

var opacity = 200

func _ready():
	$Timer.start()
	
func _process(delta):
	if $Timer.time_left != 0:
		$"Logo-amdev".modulate.a8 = opacity
		opacity -= 2
		
	if $Timer.time_left == 0:
		get_tree().change_scene("res://Scenes/Home/Home.tscn")
