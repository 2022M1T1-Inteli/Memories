extends TextureButton


signal pausePressed

func _on_TextureButton_pressed():
	emit_signal("pausePressed")
	

