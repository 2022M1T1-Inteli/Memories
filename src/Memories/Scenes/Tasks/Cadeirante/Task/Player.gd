extends KinematicBody2D

const UP = Vector2(0, -1)
const FLAP = 100
const MAXFALLSPEED = 200
const GRAVITY = 5

var motion = Vector2()
var Wall = preload("res://Scenes/Tasks/Cadeirante/Task/WallNode.tscn")
var score = 0
var paused = true
var keyPressed = false

onready var GameOverNode = get_parent().get_parent().get_parent().get_node("GameOverNode")
onready var canvasLayer = get_parent().get_parent().get_node("CanvasLayer/scoreNow")
onready var canvasLayerGO = get_parent().get_parent().get_parent().get_node("GameOverNode/CanvasLayerGO/finalScore")

func _ready():
	pass	
	

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
		
func Wall_reset():
	var Wall_instance = Wall.instance()
	Wall_instance.position = Vector2(430,rand_range(60, 140))
	get_parent().call_deferred("add_child",Wall_instance)
	
	
func _on_Resetter_body_entered(body):
	if body.name == "Walls":
		body.queue_free() 
		Wall_reset() 


func _on_Detect_area_entered(area):
	if area.name == "PointArea":
		score = score + 1
	

func _on_Detect_body_entered(body):
	if body.name == "Walls":
		get_parent().get_parent().get_parent().get_node("GameOverNode/CanvasLayerGO/finalScore").text = str(score, " / 21")		
		get_parent().get_parent().hide()
		canvasLayer.hide()
		GameOverNode.show()
		canvasLayerGO.show()


func _on_PCDexit_pressed():
	get_tree().change_scene("res://Scenes/Tasks/Cadeirante/Home/PCD-Home.tscn")
	paused = false
	get_tree().paused = false


func _on_PCDstart_pressed():
	get_tree().reload_current_scene()
	
#	get_parent().get_parent().show()
#	GameOverNode.hide()
	

func _on_memoria_body_entered(body):
	get_parent().get_parent().get_node("memoria").queue_free()

func _on_memoria2_body_entered(body):
	get_parent().get_parent().get_node("memoria2").queue_free()

func _on_memoria3_body_entered(body):
	get_parent().get_parent().get_node("memoria3").queue_free()
	get_tree().change_scene("res://Scenes/Tasks/Cadeirante/Congrats.tscn")
