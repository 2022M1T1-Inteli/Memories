extends KinematicBody2D

var posicaoMaximaEsquerda = 0
var posicaoMaximaDireita = 0

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	
	if posicaoMaximaEsquerda <= 300:
		position.x += 0.1
		position.y += 0.1
		position.y += 0.1
		posicaoMaximaEsquerda += 1
		
	if posicaoMaximaEsquerda >= 300:
		position.x += 30
		position.y += 50
		
		posicaoMaximaEsquerda = 0		
		posicaoMaximaDireita = 0
