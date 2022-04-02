extends Area2D
onready var Global = get_node("/root/VariaveisGlobais")


# Called when the node enters the scene tree for the first time.
func _ready():
	if Global.mem > 0:
		self.queue_free()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
