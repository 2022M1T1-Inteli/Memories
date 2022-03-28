extends Area2D

func _ready():
	pass # Replace with function body.

#Faz com que as memorias se movam em direção ao personagem
func _physics_process(delta):
	position += Vector2(-1, 0)
