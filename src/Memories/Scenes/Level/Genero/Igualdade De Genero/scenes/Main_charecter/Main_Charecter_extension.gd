extends Node2D
onready var Global = get_node("/root/VariaveisGlobais")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	# faz a posição da personagem igual à salva
	self.get_child(0).position = Global.posicao_celeste


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_memoria_body_entered(body):
	#faz voltar da última memória a personagem
	Global.mem +=1
	get_parent().get_node("memoria").queue_free()
	Global.posicao_celeste = self.get_child(0).position


func _on_memoria2_body_entered(body):
	#faz voltar da última memória a personagem
	Global.mem +=1
	get_parent().get_node("memoria2").queue_free()
	Global.posicao_celeste = self.get_child(0).position


func _on_memoria3_body_entered(body):
	#faz voltar da última memória a personagem
	Global.mem +=1
	get_parent().get_node("memoria3").queue_free()
	if Global.dialogo == "genero":
		Global.para_dialogo = 16
	Global.add_dialogo = true
	get_tree().change_scene("res://Scenes/World/World.tscn")
