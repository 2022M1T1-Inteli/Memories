extends KinematicBody2D

const UP = Vector2(0, -1)
const FLAP = 100
const MAXFALLSPEED = 200
const GRAVITY = 5

var motion = Vector2()
var Wall = preload("res://Scenes/Level/Cadeirante/Task/WallNode.tscn")
var score = 0
var paused = true
var keyPressed = false

onready var GameOverNode = get_parent().get_parent().get_parent().get_node("GameOverNode")
onready var canvasLayer = get_parent().get_parent().get_node("CanvasLayer/scoreNow")
onready var canvasLayerGO = get_parent().get_parent().get_parent().get_node("GameOverNode/CanvasLayerGO/finalScore")

func _ready():
	pass	
	

#Da play no jogo; Cria gravidade e pulo do personagem; Chama as animações de jump e fall
func _physics_process(delta):
	
	if (paused == true):
		get_tree().paused = true
	elif (paused == false):
		get_tree().paused = false
		
	if Input.is_action_just_pressed("FLAP"):
		keyPressed = true
	if(keyPressed == true):
		$Intrucao.hide()
		motion.y += GRAVITY
		if motion.y > MAXFALLSPEED:
			motion.y = MAXFALLSPEED

		if Input.is_action_just_pressed("FLAP"):
			motion.y = -FLAP
			paused = false
		
		motion = move_and_slide(motion, UP)
		
		if motion.y < 0 :
			$AnimatedSprite.play("jump")		
		elif motion.y > 0 :
			$AnimatedSprite.play("fall")
		
		get_parent().get_parent().get_node("CanvasLayer/scoreNow").text = str(score)

#Cria novas obstáculos para o personagem passar
func Wall_reset():
	var Wall_instance = Wall.instance()
	Wall_instance.position = Vector2(430,rand_range(60, 140))
	get_parent().call_deferred("add_child",Wall_instance)
	
#Apaga as obstáculos que passaram pelo personagem e chama a função wall_reset
func _on_Resetter_body_entered(body):
	if body.name == "Walls":
		body.queue_free() 
		Wall_reset() 

#Contabiliza a pontuação do personagem toda vez que passa pelas escadas
func _on_Detect_area_entered(area):
	if area.name == "PointArea":
		score = score + 1

#Quando o usuário encosta nos obstáculos a fase é reiniciada
func _on_Detect_body_entered(body):
	if body.name == "Walls":
		get_tree().reload_current_scene()

#Sai da fase e retorna para o mapa incial
func _on_PCDexit_pressed():
	get_tree().change_scene("res://Scenes/World/World.tscn")
	paused = false
	get_tree().paused = false


#Coleta a primeira moeda
func _on_memoria_body_entered(body):
	get_parent().get_parent().get_node("memoria").queue_free()

#Coleta a segunda moeda
func _on_memoria2_body_entered(body):
	get_parent().get_parent().get_node("memoria2").queue_free()

#Coleta a terceira moeda e chama a cena de parabéns
func _on_memoria3_body_entered(body):
	get_parent().get_parent().get_node("memoria3").queue_free()
	get_tree().change_scene("res://Scenes/Level/Cadeirante/Congrats.tscn")
