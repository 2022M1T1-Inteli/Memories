extends Sprite
var tipoCena = ""

#signal cenaCadeirante
signal cenaHomemNegro

func _ready():
	var dialogo = get_tree().get_root().find_node("Player", true, false)
	dialogo.connect("cadeiranteFase", self, "set_is_visible_cadeirate")				
#set a visiblidade da sprite		
func set_is_visible_cadeirate():
	$"../Sprite".visible = !visible
	tipoCena = "Cadeirante"
	
#função nativa de eventos para iniciar o dialogo
func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):
		emit_signal("cenaCadeirante")
			
	
