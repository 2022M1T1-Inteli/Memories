extends StaticBody2D

var keyPressed = false

func _ready():
	pass 

func _physics_process(delta):
	
	if Input.is_action_just_pressed("ui_up"):
		keyPressed = true
	if(keyPressed == true):
		position += Vector2(-1, 0)
