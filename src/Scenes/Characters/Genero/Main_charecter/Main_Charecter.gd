extends KinematicBody2D

onready var camera = $Camera2D
onready var timer = $Timer

var movement = Vector2(0,0)
var speed = 100
var friction = 0.1
var insta_stop

var dash_speed
var dash_lenght

var gravity = 7
var fall_speed
var max_fall_speed = 100
var jumpforce = 200


var on_ground 

var is_kicking = false


func estado_raycast():
	if $AnimatedSprite.flip_h:
		
		$RayCaste.enabled = true
		$RayCastd.enabled = false
	else:
		$RayCastd.enabled = true
		$RayCaste.enabled = false

func gravidade():
	if movement.y <= max_fall_speed:
		movement.y += gravity
	if on_ground:
		movement.y =0 

func wall_kick():
	if $RayCastd.is_colliding() and Input.is_action_just_pressed("ui_select") and not on_ground:
		movement.x = -speed*2
		movement.y = -jumpforce*0.8
		$AnimatedSprite.set_flip_h(true) 
		is_kicking = true
		timer.set_wait_time(0.2)
		timer.start()
		

	if $RayCaste.is_colliding() and Input.is_action_just_pressed("ui_select") and not on_ground:
		movement.x = speed*2
		movement.y = -jumpforce*0.8
		$AnimatedSprite.set_flip_h(false) 
		is_kicking = true
		timer.set_wait_time(0.2)
		timer.start()
  
func movement_x():
	if Input.is_action_pressed("ui_right") and not $RayCastd.is_colliding() :
		if movement.x > speed:
			pass
		
		else:
			movement.x= speed
		
		$AnimatedSprite.play("running")
		$AnimatedSprite.set_flip_h(false)
		estado_raycast()



	elif Input.is_action_pressed("ui_left") and not $RayCaste.is_colliding():
		if movement.x < -speed:
			pass
		
		else:
			movement.x= -speed
		
		$AnimatedSprite.play("running")
		$AnimatedSprite.set_flip_h(true)
		estado_raycast()
		

	if movement.x > 30:
		movement.x -= friction*speed

	elif movement.x <-30:
		movement.x += friction*speed

	else :
		movement.x = 0                                                                             
		$AnimatedSprite.play("idle")

func _ready():
	camera.make_current()

func _physics_process(_delta):

	estado_raycast()

	on_ground = is_on_floor()

	if not  is_kicking:
		movement_x()

	wall_kick()

	gravidade()


	if Input.is_action_just_pressed("ui_select") and movement.y<8 and movement.y>=0:
		movement. y = -jumpforce




	elif not on_ground  and movement.y > 8:
		$AnimatedSprite.play("falling")
		

	elif not on_ground  and movement.y < 0:
		$AnimatedSprite.play("jumping")

	if movement == Vector2(0,0) and on_ground:
		$AnimatedSprite.play("idle")

	

# warning-ignore:return_value_discarded
	move_and_slide(movement, Vector2(0,-1))



func _on_Timer_timeout():
	is_kicking=false
	timer.stop()
	
