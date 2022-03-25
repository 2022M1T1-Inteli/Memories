extends NinePatchRect

export var dialogPath = ""

export(float) var textSpeed = 0.05

var dialog
var phraseNum = 0
var finished = false
onready var text = $"Text"
onready var nameNpc = $"Name"

func _ready():
	$Timer.wait_time = textSpeed
	dialog = getDialog()
	assert(dialog, "Dialogo não encontrado")
	nextPhrase()
	#funcao para verificar se o caminho é verdadeiro
func _process(_delta):
	if Input.is_action_just_pressed("ui_accept"):
		if finished:
			nextPhrase()
		else:
			text.visible_characters = len(text.text)
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
		
func nextPhrase()-> void:	
	if phraseNum >= len(dialog[0]["Text"][phraseNum]):
		queue_free()
		return null
		
	finished = false
	nameNpc.bbcode_text = dialog[0]["Name"]
	text.bbcode_text = dialog[0]["Text"][phraseNum]
	text.visible_characters = 0
	while text.visible_characters <len(text.text):
		text.visible_characters += 1
		$Timer.start()
		yield($Timer, "timeout")
	finished = true
	phraseNum +=1
	return
