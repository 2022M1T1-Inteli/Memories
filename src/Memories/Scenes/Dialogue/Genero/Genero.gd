extends Node2D


var pagina=0

var texto=["olá forasteiro é um prazer te ver","eu te contarei uma história sobre igualdade de gênero","Você quer houvir meu conto?"]
#texto da pergunta

var respostas= [["op1","op2","op3"],["op11","op22","op33"],["op111","op222","op333"]]
#respostas


var certo =["Button1","Button2","Button3"]
var acerto=0
var controle = texto.size() - 2
#botão certo

func _ready():
	
	$pergunta.set_bbcode(texto[0])

	
	#texto dos butões

func vira_pagina():
	print (pagina)
	print (controle)
	if pagina  == controle:
		$Previous.hide();
		
		
		
	if pagina +1< texto.size():
		pagina +=1
		$pergunta.set_bbcode(texto[pagina])
		$Previous.text=  respostas[controle][0]
		$Next.text= respostas[controle][1]
	# muda as perguntas e respostas
	
func volta_pagina():
	if pagina != 0:
		pagina -=1
		$pergunta.set_bbcode(texto[pagina])
		$Previous.text=  respostas[controle][0]
		$Next.text= respostas[controle][1]
