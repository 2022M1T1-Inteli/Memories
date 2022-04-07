extends Sprite

signal chamaCena

onready var Global = get_node("/root/VariaveisGlobais")
func _ready():
	var dialogo = get_tree().get_root().find_node("Player", true, false)	
	dialogo.connect("dialogo", self, "set_is_visible")		
		
func set_is_visible():
	$"../Enter_Layer".visible = !visible
	
func _unhandled_input(event):
	if event.is_action_pressed("ui_accept") and $"../Enter_Layer".visible == true:
		print(Global.dialogoAtivo)
		if Global.dialogoAtivo == null:
			emit_signal("chamaCena")
			var cena = load("res://Scenes/Dialogue/Dialogue.tscn").instance()
			add_child(cena)