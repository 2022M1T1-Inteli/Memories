extends Sprite

#variaveis de controle para ajudar na movimentação da imagem
var posicaoMaximaEsquerda = 0
var posicaoMaximaDireita = 0

func _physics_process(delta):
	#verifica enquanto a varivael de controle for menor que 150.
	if posicaoMaximaEsquerda <= 150:
		#diminui valor ao eixo x criando um aspecto de movimento
		position.x += -0.1
		#soma a variavel de controle mais 1
		posicaoMaximaEsquerda += 1
	#faz a verifação dos tamanhos das variaveis de controle
	if posicaoMaximaEsquerda >= 150 && posicaoMaximaDireita<=150 :
		#se amabas forem verdadeiras
		#aumenta o valor do eixo x criando um aspecto de movimento
		position.x += 0.1
		#soma a variavel de controle mais 1
		posicaoMaximaDireita += 1
	#faz a verifação dos tamanhos das variaveis de controle
	if posicaoMaximaEsquerda >= 150 && posicaoMaximaDireita>=150 :
		#se amabas forem verdadeiras
		#zera as variaveis de controle
		posicaoMaximaEsquerda = 0
		posicaoMaximaDireita = 0

