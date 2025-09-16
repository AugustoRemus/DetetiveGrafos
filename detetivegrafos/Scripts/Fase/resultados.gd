extends Control
@onready var debug: Label = $Label

@export var voltarBotao: Button

var _totalErros



func _ready() -> void:
	_totalErros = Matrizes.calcularErro()
	debug.text = str(_totalErros)
	
	var _nivelAtual = Niveis.faseAtual
	
	#falhou
	if _totalErros >= 3:
		return
		#botar label e tals
	else:
		Niveis.fasesPontos[_nivelAtual] = _totalErros+1
		if _nivelAtual != Niveis.quantNiveis:
			#libera o proximo nivel se n foi o ultimo
			Niveis.fasesPontos[_nivelAtual+1] = 0
		
	

func _on_voltar_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
