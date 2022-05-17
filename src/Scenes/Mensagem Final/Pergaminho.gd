extends Node2D

onready var Global = get_node("/root/VariaveisGlobais")

func _ready():
	
	# checka se já viu o final
	Global.ja_viu_final = true
	
