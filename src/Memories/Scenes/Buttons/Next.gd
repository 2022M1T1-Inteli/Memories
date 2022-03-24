extends Button

onready var audioClick = $Click
onready var audioHover = $Hover
func _ready():

#registra o click do mouse
	connect("mouse_entered",self,"_on_Button_mouse_entered")
	connect("pressed",self,"_on_Button_Pressed")
	

func _on_Button_mouse_entered():
	
	# toca o audio quando o mouse passa pro cima
	grab_focus()
	audioHover.play()

func _on_Button_Pressed():
	
	#toca o audio quando o mouse clicka no botão
		audioClick.play()
		yield(audioClick, "finished")
