extends KinematicBody2D

#declaração das variáveis
var iniciou = false
var SPEED = 145
var velocidade = Vector2()
var FLOOR = Vector2(0, -1)

#	iniciar o jogo somente quando o espaço for apertado
func _physics_process(delta):
	if Input.is_action_just_pressed("jump"):
		$AnimatedSprite.play("run")
		iniciou = true

#	Definir a velocidade com a qual o jogador irá correr 
	if iniciou == true:
		velocidade.x = SPEED
		velocidade = move_and_slide(velocidade, FLOOR)
