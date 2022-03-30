extends Sprite
var tipoCena = ""
var cena = ""
var cenaCarregada = ""
var myNode = preload("res://Scenes/Dialogue/Cadeirante/Dialogue_Cadeirante.tscn")

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
			var myNode_instance = myNode.instance()
			add_child(myNode_instance)
			
		if tipoCena == "HomemNegro":
			cenaCarregada = load("res://Scenes/Dialogue/Racial/Dialogo_racial.tscn")
			cena = cenaCarregada.instance()
			add_child(cena)
