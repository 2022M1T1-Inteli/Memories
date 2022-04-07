extends Button
#instancia o player do audio click
onready var audioClick = $Click
#instancia o player do audio click
onready var audioHover = $Hover

signal pauseFasePressed
#função quando o botão é pressionado
func _on_Pause_Button_pressed():
	audioClick.play()
	yield(audioClick, "finished")
	emit_signal("pauseFasePressed")
	
#toca audio do botão
func _on_Pause_Button_mouse_entered():
	audioHover.play()
