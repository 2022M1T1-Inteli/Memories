extends Sprite
var tipoCena = ""
var cena = ""
var cenaCarregada = ""

func _ready():
	var dialogo = get_tree().get_root().find_node("Player", true, false)
	dialogo.connect("cadeiranteFase", self, "set_is_visible_cadeirate")		
	dialogo.connect("homemNegro", self, "set_is_visible_homem_negro")		
		
func set_is_visible_cadeirate():
	$"../Sprite".visible = !visible
	tipoCena = "Cadeirante"
	
func set_is_visible_homem_negro():
	$"../Sprite".visible = !visible
	tipoCena = "HomemNegro"
	
func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):
		if tipoCena == "Cadeirante":
			cenaCarregada = load("res://Scenes/Dialogue/Cadeirante/Dialogo_cadeirante.tscn")
			cena = cenaCarregada.instance()
			add_child(cena)
		if tipoCena == "HomemNegro":
			cenaCarregada = load("res://Scenes/Dialogue/Cadeirante/Dialogo_cadeirante.tscn")
			cena = cenaCarregada.instance()
			add_child(cena)
