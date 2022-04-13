extends Sprite

export var dialogPath = ""

export(float) var textSpeed = 0.05
var a = 0
var dialog
var finished = false
var index = 0
var showBtn
var trocaCenas = 0
onready var text = $"Text"
onready var nameNpc = $"Name"
onready var Global = get_node("/root/VariaveisGlobais")

func _ready():
	verifcaDiaolog()
	setIsVisible()
	$Timer.wait_time = textSpeed
	dialog = getDialog()
	assert(dialog, "Dialogo não encontrado")
	$Yes.hide()
	$No.hide()
	$"../Plate".visible = true
	nextPhrase()
	#funcao para verificar se o caminho é verdadeiro
func _physics_process(_delta):
	if Input.is_action_just_pressed("jump"):
		if Global.dialogo == null:	
			$"../Plate".visible = false	
		else: 	
			$"../Plate".visible = true
			Global.dialogoAtivo = null
				
		if finished:
			if Global.posicao_dialogo != trocaCenas:
				nextPhrase()
		else:
			text.visible_characters = len(text.text)

func setIsVisible():
	verifcaDiaolog()
	$"../Plate".visible = !visible

func getDialog()->Array:
	var file = File.new()
	assert(file.file_exists(dialogPath), "Caminho não encontrado")
	file.open(dialogPath, File.READ)
	var jsonFile = file.get_as_text()
	var jsonFormatado = parse_json(jsonFile)
	if typeof(jsonFormatado) == TYPE_ARRAY:
		return jsonFormatado
	else:
		return []

func nextPhrase()->void:
	if Global.posicao_dialogo >= len(dialog[index]["text"]):
		Global.dialogoAtivo = true
		Global.posicao_dialogo = 0
		get_tree().paused = false
		queue_free()
	else:
		finished = false
		nameNpc.bbcode_text = dialog[index]["name"]
		text.bbcode_text = dialog[index]["text"][Global.posicao_dialogo]
		text.visible_characters = 0
		while text.visible_characters <len(text.text):
			text.visible_characters += 1
			$Timer.start()
			yield($Timer, "timeout")
		a = a +1
		Global.posicao_dialogo = a
		finished = true
		if Global.posicao_dialogo == showBtn:
			$Yes.show()
			$No.show()
			$Instrucao.hide()
		if Global.posicao_dialogo == Global.para_dialogo:
			$TimerTrocaCena.start()
			yield($TimerTrocaCena, "timeout")
			get_tree().paused = false
			if Global.dialogo == "cadeirante":
				get_tree().change_scene("res://Scenes/Level/Cadeirante/Task/PCD-World.tscn")
			if Global.dialogo == "homemNegro":
				get_tree().change_scene("res://Scenes/Level/Racial/World/Mundo.tscn")
			if Global.dialogo == "genero":
				get_tree().change_scene("res://Scenes/Level/Genero/Igualdade De Genero/scenes/Principal/Principal.tscn")
		return

func _on_Yes_pressed():
	$Yes.hide()
	$No.hide()
	nextPhrase()
		
func verifcaDiaolog():
	if Global.dialogo == "cadeirante":
		index = 0
		showBtn = 4
		Global.para_dialogo = 5
	if Global.dialogo == "homemNegro":
		index = 1
		showBtn = 13
		Global.para_dialogo = 14
	if Global.dialogo == "genero":
		index = 2
		showBtn = 6
		Global.para_dialogo = 7
	trocaCenas = showBtn
	if Global.add_dialogo == true:
		a = Global.posicao_dialogo
	if Global.add_dialogo == false:
		Global.posicao_dialogo = 0
		
func _on_No_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://Scenes/World/World.tscn")
