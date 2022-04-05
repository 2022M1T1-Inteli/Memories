extends Sprite

export var dialogPath = ""

export(float) var textSpeed = 0.05

var dialog
var phraseNum = 0
var finished = false
var index = 0
var showBtn
var trocaCenas = 0
onready var text = $"Text"
onready var nameNpc = $"Name"
onready var Global = get_node("/root/VariaveisGlobais")

func _ready():
	verifcaDiaolog()
	var dialogo = get_tree().get_root().find_node("Enter_Layer", true, false)
	dialogo.connect("chamaCena", self, "setIsVisible")
	$Timer.wait_time = textSpeed
	$TimerTrocaCena.start()
	dialog = getDialog()
	assert(dialog, "Dialogo não encontrado")
	$Yes.hide()
	$No.hide()
	$"../Plate".visible = false
	nextPhrase()	
	#funcao para verificar se o caminho é verdadeiro
func _physics_process(_delta):
	if Input.is_action_just_pressed("jump"):
		if Global.dialogo == null:	
			$"../Plate".visible = false	
		else: 	
			$"../Plate".visible = true			
		if finished:
			if phraseNum != trocaCenas:
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
	if phraseNum == showBtn:
		$Yes.show()
		$No.show()
	finished = false
	nameNpc.bbcode_text = dialog[index]["name"]
	text.bbcode_text = dialog[index]["text"][phraseNum]
	text.visible_characters = 0
	while text.visible_characters <len(text.text):
		text.visible_characters += 1
		$Timer.start()
		yield($Timer, "timeout")
	finished = true
	phraseNum += 1	
	
	if phraseNum == len(dialog[index]["text"]):
		$TimerTrocaCena.start()
		yield($TimerTrocaCena, "timeout")
		print($TimerTrocaCena.time_left)
		if Global.dialogo == "cadeirante":
			get_tree().change_scene("res://Scenes/Level/Cadeirante/Task/PCD-World.tscn")
		if Global.dialogo == "homemNegro":
			get_tree().change_scene("res://Scenes/Level/Racial/World/Mundo.tscn")
	return


func _on_Yes_pressed():
	
	nextPhrase()
	$Yes.hide()
	$No.hide()
	
func verifcaDiaolog():
	if Global.dialogo == "cadeirante":
		index = 0
		showBtn = 3
	if Global.dialogo == "homemNegro":
		index = 1
		showBtn = 5
	trocaCenas = showBtn + 1
	
func _on_No_pressed():
	get_tree().change_scene("res://Scenes/World/World.tscn")
	

