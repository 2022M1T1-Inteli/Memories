extends Button



export var reference_path = ""
export(bool) var start_focused = false

#instancia o player do audio click
onready var audioClick = $Click

#instancia o player do audio click
onready var audioHover = $Hover
onready var Global = get_node("/root/VariaveisGlobais")
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
	
	#toca o som
	audioHover.play()

func _on_Button_Pressed():
	
	# função ao passar o click
	#verifica se o caminho da cena não esta vazio
	get_tree().paused = false
	
		
		#se não tiver toca o som de clicado
	audioClick.play()
		
		#faz com que o som seja tocado até o seu final
	yield(audioClick, "finished")
		
		#troca a cena
	if Global.dialogo == "genero":
		Global.para_dialogo = 16
	Global.add_dialogo = true
	get_tree().change_scene("res://Scenes/World/World.tscn")
		

	
