extends Sprite
var tipoCena = ""

#signal cenaCadeirante
signal cenaHomemNegro

func _ready():
	var dialogo = get_tree().get_root().find_node("Player", true, false)	
	dialogo.connect("homemNegro", self, "set_is_visible_homem_negro")		
		

func set_is_visible_homem_negro():
	$"../Sprite".visible = !visible
	
func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):
		emit_signal("cenaHomemNegro")
