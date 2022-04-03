extends Area2D


onready var Global = get_node("/root/VariaveisGlobais")

# Called when the node enters the scene tree for the first time.
func _ready():
	
	#retira memórias já coletadas
	if Global.mem > 2:
		self.queue_free()
