extends Sprite

export var dialogPath = ""

export(float) var textSpeed = 0.05

var dialog
var phraseNum = -1
var finished = false

onready var text = $"Text"
onready var nameNpc = $"Name"

func _ready():
	$Timer.wait_time = textSpeed
	dialog = getDialog()
	assert(dialog, "Dialogo não encontrado")
	nextPhrase()
	$Yes.hide()
	$No.hide()
	$"../Plate".visible = false
	var dialogo = get_tree().get_root().find_node("Player", true, false)
	dialogo.connect("cenaCadeirante", self, "set_is_visible_cadeirate")	
	#funcao para verificar se o caminho é verdadeiro
func _physics_process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		$"../Plate".visible = true		
		if finished:
			if phraseNum != 4:
				nextPhrase()
		else:
			text.visible_characters = len(text.text)
		
func set_is_visible_cadeirate():
	$"../Plate".visible = !visible	
	
func getDialog()->Array:
	#instancia o arquivo
	var file = File.new()
	#verifica se o caminho é verdadeiro
	assert(file.file_exists(dialogPath), "Caminho não encontrado")
	#se for verdadeiro o caminho, abre o arquivo
	file.open(dialogPath, File.READ)
	#pega o que tem dentro do json
	var jsonFile = file.get_as_text()
	var jsonFormatado = parse_json(jsonFile)
	if typeof(jsonFormatado) == TYPE_ARRAY:
		return jsonFormatado
	else:
		return []
	
		
func nextPhrase()->void:	
	if phraseNum == 3:
		$Yes.show()
		$No.show()
	if phraseNum >= len(dialog[0]["text"][phraseNum]):
		queue_free()
		return null
	finished = false
	nameNpc.bbcode_text = dialog[0]["name"]
	text.bbcode_text = dialog[0]["text"][phraseNum]
	text.visible_characters = 0
	while text.visible_characters <len(text.text):
		text.visible_characters += 1
		$Timer.start()
		yield($Timer, "timeout")
	finished = true
	
	if phraseNum == 4:
		$Timer.start()
		yield($Timer, "timeout")
		print("Ola")
		
		get_tree().change_scene("res://Scenes/Level/Cadeirante/Task/PCD-World.tscn")
	phraseNum +=1
	return


func _on_Yes_pressed():
	phraseNum == 4
	nextPhrase()
	$Yes.hide()
	$No.hide()

func _on_No_pressed():
	pass # Replace with function body.
