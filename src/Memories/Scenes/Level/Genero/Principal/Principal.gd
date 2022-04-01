extends KinematicBody2D

var movement = Vector2(0,0)
var speed = 100

var gravity = 6
var fall_speed
var max_fall_speed

var on_gravity = true
var on_ground 
#movimentação do personagem
func _physics_process(_delta):
	print(Engine.get_frames_per_second())
	on_ground = is_on_floor()
	if Input.is_action_pressed("ui_right"):
		movement.x = speed
	elif Input.is_action_pressed("ui_left"):
		movement.x = -speed	
	else :
		movement.x = 0
	
	move_and_slide(movement,Vector2(0,-1))
