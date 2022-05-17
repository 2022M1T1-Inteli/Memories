extends Button

onready var audioClick = $Click
onready var audioHover = $Hover
func _ready():

		
	connect("mouse_entered",self,"_on_Button_mouse_entered")
	connect("pressed",self,"_on_Button_Pressed")
	
#tocar o audio do butão ao passar o mouse em cima
func _on_Button_mouse_entered():
	grab_focus()
	audioHover.play()
#toca o audio ao pressionar o botão
func _on_Button_Pressed():
		audioClick.play()
		yield(audioClick, "finished")
