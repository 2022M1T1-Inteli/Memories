extends Sprite
var tipoCena = ""

#signal cenaCadeirante
signal cenaHomemNegro

func _ready():
	var dialogo = get_tree().get_root().find_node("Player", true, false)	
	dialogo.connect("homemNegro", self, "set_is_visible_homem_negro")		
		
#set a visiblidade da sprite
func set_is_visible_homem_negro():
	$"../Sprite".visible = !visible

#função nativa de eventos para iniciar o dialogo
func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):
		emit_signal("cenaHomemNegro")
