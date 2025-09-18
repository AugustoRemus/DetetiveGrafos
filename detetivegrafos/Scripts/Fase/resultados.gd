extends Control
@onready var debug: Label = $Label

@export var voltarBotao: Button


@export var quantErros: Label
@export var tempoRestante: Label
@export var resultado: Label

@export var estrelasTextura: TextureRect
@export var arrayTexturas: Array[Texture2D]

var _totalErros



func _ready() -> void:
	_totalErros = Matrizes.calcularErro()
	quantErros.text = str(_totalErros)
	
	var _nivelAtual = Niveis.faseAtual
	
	#falhou
	if _totalErros >= 3:
		resultado.text = "FALHADA!"
		estrelasTextura.texture = arrayTexturas[0]
		return
		#botar label e tals
	else:
		resultado.text = "CONCLUIDA!"
		Niveis.fasesPontos[_nivelAtual] = _totalErros+1
		estrelasTextura.texture = arrayTexturas[_totalErros+1]
		
		if _nivelAtual != Niveis.quantNiveis:
			#libera o proximo nivel se n foi o ultimo
			Niveis.fasesPontos[_nivelAtual+1] = 0
		
	

func _on_voltar_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menus/menu.tscn")
