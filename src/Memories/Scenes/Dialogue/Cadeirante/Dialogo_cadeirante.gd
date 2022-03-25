extends CanvasLayer


func _ready():
	Dialogic.start("")
	var dialogo = Dialogic.start("Stephen Hawking")
	add_child(dialogo)
