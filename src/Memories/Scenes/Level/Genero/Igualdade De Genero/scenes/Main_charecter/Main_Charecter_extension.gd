extends Node2D
onready var Global = get_node("/root/VariaveisGlobais")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.get_child(0).position = Global.posicao_celeste


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_memoria_body_entered(body):
	Global.mem +=1
	get_parent().get_node("memoria").queue_free()
	Global.posicao_celeste = self.get_child(0).position


func _on_memoria2_body_entered(body):
	Global.mem +=1
	get_parent().get_node("memoria2").queue_free()
	Global.posicao_celeste = self.get_child(0).position
