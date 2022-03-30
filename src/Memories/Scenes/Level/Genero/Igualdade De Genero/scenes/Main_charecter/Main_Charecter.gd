extends KinematicBody2D

onready var camera = $Camera2D
onready var timer = $Timer
onready var Global = get_node("/root/VariaveisGlobais")

var movement = Vector2(0,0)
var speed = 100
var friction = 0.1
var instaStop

var dashSpeed
var dashLenght

var gravity = 7
var fallSpeed
var maxFallSpeed = 100
var jumpForce = 200


var onGround 

var isKicking = false

# verifica a direção em que o personagem esta virado e muda a detecção de colisão com o muro
func estado_raycast():
	if $AnimatedSprite.flip_h:
		
		$RayCaste.enabled = true
		$RayCastd.enabled = false
	else:
		$RayCastd.enabled = true
		$RayCaste.enabled = false

#gravidade
func gravidade():
	if movement.y <= maxFallSpeed:
		movement.y += gravity
	if onGround:
		movement.y =0 

# faz o wall kikc
func wall_kick():
	if $RayCastd.is_colliding() and Input.is_action_just_pressed("ui_up") and not onGround:
		movement.x = -speed*2
		movement.y = -jumpForce*0.8
		$AnimatedSprite.set_flip_h(true) 
		isKicking = true
		timer.set_wait_time(0.2)
		timer.start()
		

	if $RayCaste.is_colliding() and Input.is_action_just_pressed("ui_up") and not onGround:
		movement.x = speed*2
		movement.y = -jumpForce*0.8
		$AnimatedSprite.set_flip_h(false) 
		isKicking = true
		timer.set_wait_time(0.3)
		timer.start()
 
#controla o movimento no eixo x 
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

#mexe na camera
func _ready():
	
	#foca a camera
	camera.make_current()


func _physics_process(_delta):

	

	# verifica a direção em que o personagem esta virado e muda a detecção de colisão com o muro
	estado_raycast()

	#verifica se esta no chão a personagem
	onGround = is_on_floor()

# anda normal se não esta dando wall_kick
	if not  isKicking:
		movement_x()

	#verifica se esta chutando o muro
	wall_kick()

	#gravidade do jogo
	gravidade()

# pulo
	if Input.is_action_just_pressed("ui_up") and movement.y<8 and movement.y>=0:
		movement. y = -jumpForce



#animação de queda
	elif not onGround  and movement.y > 8:
		$AnimatedSprite.play("falling")
		

#animação de pulo
	elif not onGround  and movement.y < 0:
		$AnimatedSprite.play("jumping")

#animação idle
	if movement == Vector2(0,0) and onGround:
		$AnimatedSprite.play("idle")

	

# warning-ignore:return_value_discarded
#movimentação do personagem
	move_and_slide(movement, Vector2(0,-1))


#Timer da duração wall kick
func _on_Timer_timeout():
	isKicking=false
	timer.stop()
	
