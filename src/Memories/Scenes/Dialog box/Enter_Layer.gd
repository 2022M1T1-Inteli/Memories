extends Sprite

func _ready():
	var fase = get_tree().get_root().find_node("Player", true, false)
	print(fase)
	fase.connect("cadeiranteFase", self, "set_is_fase")
	
func _unhandled_input(event):
	if event.is_action_pressed("ui_end"):
		print("aaa")
	
func set_is_fase():
	$Sprite.hide = true
