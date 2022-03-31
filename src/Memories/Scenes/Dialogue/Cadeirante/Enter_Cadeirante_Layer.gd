extends Sprite
var tipoCena = ""

#signal cenaCadeirante
signal cenaHomemNegro

func _ready():
	var dialogo = get_tree().get_root().find_node("Player", true, false)
	dialogo.connect("cadeiranteFase", self, "set_is_visible_cadeirate")				
		
func set_is_visible_cadeirate():
	$"../Sprite".visible = !visible
	tipoCena = "Cadeirante"
	
	
func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):
		emit_signal("cenaCadeirante")
			
	
