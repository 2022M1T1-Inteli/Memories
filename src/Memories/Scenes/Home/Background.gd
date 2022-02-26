extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var posicaoMaximaEsquerda = 0
var posicaoMaximaDireita = 0

# Called when the node enters the scene tree for the first time.
func _physics_process(delta):
	
	if posicaoMaximaEsquerda <= 150:
		position.x += -0.1
		posicaoMaximaEsquerda += 1
		
	if posicaoMaximaEsquerda >= 150 && posicaoMaximaDireita<=150 :
		position.x += 0.1
		posicaoMaximaDireita += 1

	if posicaoMaximaEsquerda >= 150 && posicaoMaximaDireita>=150 :
		posicaoMaximaEsquerda = 0
		posicaoMaximaDireita = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
