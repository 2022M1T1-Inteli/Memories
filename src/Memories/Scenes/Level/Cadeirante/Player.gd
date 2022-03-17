extends KinematicBody2D

const UP = Vector2(0, -1)
const FLAP = 100
const MAXFALLSPEED = 200
const GRAVITY = 5


var motion = Vector2()
var Wall = preload("res://Scenes/Level/Cadeirante/WallNode.tscn")
var score = 0
var keyPressed = false
func _ready():
	pass

func _physics_process(delta):
	if Input.is_action_just_pressed("ui_up"):
		keyPressed = true
	if(keyPressed == true):
		$Intrucao.hide()
		motion.y += GRAVITY
		if motion.y > MAXFALLSPEED:
			motion.y = MAXFALLSPEED
		if Input.is_action_just_pressed("ui_up"):
			motion.y = -FLAP
		motion = move_and_slide(motion, UP)
		if motion.y < 0 :
			$AnimatedSprite.play("jump")		
		elif motion.y > 0 :
			$AnimatedSprite.play("fall")
		get_parent().get_parent().get_node("CanvasLayer/Score").text = str(score)	
		
func Wall_reset():
	var Wall_instance = Wall.instance()
	Wall_instance.position = Vector2(270,rand_range(60, 140))
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
		get_tree().reload_current_scene()