extends Area2D

onready var Global = get_node("/root/VariaveisGlobais")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	
	#retira memórias já coletadas
	if Global.mem > 1:
		self.queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
