extends CanvasLayer


func _ready():
	var dialogo = Dialogic.start("Cadeirante") 
	add_child(dialogo)
