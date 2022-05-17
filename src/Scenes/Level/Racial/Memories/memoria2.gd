extends Area2D

onready var Global = get_node("/root/VariaveisGlobais")

func _ready():
	
	#retira memórias já coletadas
	if Global.mem > 1:
		self.queue_free()


