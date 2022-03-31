extends KinematicBody2D

#declaração das variáveis do Script
var SPEED = 150
var JUMP = 300
var gravidade = 1000
var velocidade = Vector2()
var FLOOR = Vector2(0, -1)
var on_ground = false
var iniciou = false

#onready var animacaoTree = $AnimationTree
onready var animacaoPlayer = $AnimationPlayer
#onready var animacaoState = animacaoTree.get("parameters/playback")

func _physics_process(delta):
	
#	iniciar o jogo somente quando o espaço for apertado
	if Input.is_action_just_pressed("jump"):
		iniciou = true
		
		
#	iniciar a velocidade do jogador
	if iniciou == true:
		velocidade.x = SPEED
#		animacaoPlayer.stop()
#	jogador pula se o espaço for apertado
		animacaoPlayer.play("Walk")
		if Input.is_action_just_pressed("jump"):
			
#	permitir que o pulo só acontaça se o jogador estiver tocando o chão
			if on_ground == true:
				velocidade.y = -JUMP
				on_ground = false
				

		velocidade.y += gravidade * delta
		velocidade = move_and_slide(velocidade, FLOOR)
		
#	verificar se o jogador está no chão
		if is_on_floor():
			on_ground = true
		else:
			on_ground = false
