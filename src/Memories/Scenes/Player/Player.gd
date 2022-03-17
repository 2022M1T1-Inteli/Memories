extends KinematicBody2D

const ACELERACAO = 500
const VELOCIDADE_MAX = 80
const FRICCAO = 500
var velocidade = Vector2.ZERO
var isInside = false
#variavel com a animação
onready var animacaoPlayer = $AnimationPlayer
#varivael que contem todas a amaração de todas as animações dos persongens
onready var animacaoTree = $AnimationTree
#variavel que pega as animações e devolver pra sser executada
onready var animacaoState = animacaoTree.get("parameters/playback")



func _physics_process(delta): 
	isInside = false;
	
	#declaração e inicial do vetor
	var input_vector = Vector2.ZERO
	#calculo da posição do vetor no eixo x dando as coordenadas
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	#calculo da posição do vetor no eixo y dando as coordenadas	
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	#reduz o comprimento 1 enquanto preserva sua direção
	input_vector = input_vector.normalized()
	#testa se o vetor se mexeu
	if input_vector != Vector2.ZERO:
		#seta a animação de parado e andando
		animacaoTree.set("parameters/Idle/blend_position", input_vector)
		animacaoTree.set("parameters/Run/blend_position", input_vector)		
		animacaoState.travel("Run")
		#calcula a velocidade com base na constante de velocidade, aceleracao multiplicado por delta
		velocidade = velocidade.move_toward(input_vector * VELOCIDADE_MAX, ACELERACAO * delta)		
	else:
		#se a animação não se mexer seta a animação de parado
		animacaoState.travel("Idle")	
		#calcula a velocidade para ficar parado	
		velocidade = velocidade.move_toward(Vector2.ZERO, FRICCAO * delta)
	velocidade = move_and_slide(velocidade)

# ao colidir com NPC do homem negro no mapa chama a função
func _on_Homem_Negro_body_entered(body):
	#Troca de Cena
	get_tree().change_scene("res://Scenes/Tasks/Racismo.tscn")
	
# ao colidir com NPC do cadeirante no mapa chama a função
func _on_Cadeirante_body_entered(body):
	#Troca de Cena	
	get_tree().change_scene("res://Scenes/Tasks/Cadeirante/Home/PCD-Home.tscn")	
	get_tree().change_scene("res://Scenes/Tasks/PCD-Home.tscn")	


func _on_magdalene_area_body_entered(body):
	if body.name == "Player" :
		get_tree().change_scene("res://Scenes/Tasks/igualdade_de_genero_task.tscn")
	
	pass # Replace with function body.
