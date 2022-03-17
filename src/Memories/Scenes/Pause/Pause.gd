extends Control

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
	
func _on_Home_pressed():
	get_tree().change_scene("res://Scenes/Home/Home.tscn")
