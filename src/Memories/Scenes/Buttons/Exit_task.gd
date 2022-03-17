extends Button


export var reference_path = ""
export(bool) var start_focused = false

#instancia o player do audio click
onready var audioClick = $Click
#instancia o player do audio click
onready var audioHover = $Hover
func _ready():
	
	
#verifica se inciou selecionado
	if(start_focused):
		grab_focus()
#conecta o sinal da ação a função
	connect("mouse_entered",self,"_on_Button_mouse_entered")
#conecta o sinal da ação a função
	connect("pressed",self,"_on_Button_Pressed")
	

func _on_Button_mouse_entered():
	# função ao passar o mouse em cima setando o design
	grab_focus()
	
	

func _on_Button_Pressed():
	# função ao passar o click
	#verifica se o caminho da cena não esta vazio
	if(reference_path != ""):
		get_tree().change_scene(reference_path)
	#se estiver vazio o caminho	
	else:
		#troca a cena		
		get_tree().change_scene("res://Scenes/World/World.tscn")
