extends Control

#instancia o player do audio click
onready var audioClick = $Click

#instancia o player do audio click
onready var audioHover = $Hover

func _unhandled_input(event):
	if event.is_action_pressed("ui_end"):
		set_is_paused()
	
func set_is_paused():
	get_tree().paused = !get_tree().paused
	visible = !visible
	
func _ready():
	var pauseButton = get_tree().get_root().find_node("Pause_Button", true, false)
	pauseButton.connect("pausePressed", self, "set_is_paused")

func _on_Back_pressed():
	set_is_paused()
	audioClick.play()

func _on_Back_mouse_entered():
	audioHover.play()
	
func _on_Home_pressed():
	audioClick.play()
	yield(audioClick, "finished")
	get_tree().change_scene("res://Scenes/Home/Home.tscn")
	
	
	
func _on_Home_mouse_entered():
	audioHover.play()
