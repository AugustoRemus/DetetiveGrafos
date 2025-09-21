extends Control

var carregarScena: PackedScene
var faseSelecionada: fase = null

@export var numeroFaseLabel : Label
@export var botaoPlay:Button
@export var labelPont: Label

@export var gridContainerBotoesLvl: GridContainer

@export var medalhaIcone: TextureRect
@export var medalhasSprites: Array[Texture2D]

##botar em ordem!
@export var todosBotoes: Array[Button]

func _ready() -> void:
	#testa quais ele pode jogar
	for fase in range(Niveis.quantNiveis):
		if Niveis.fases[fase].liberada == false:
			#desabilita
			var _botao = gridContainerBotoesLvl.get_child(fase - 1)
			_botao.disabled = true
		
		



func _on_fase_0_pressed() -> void:
	
	var scenaPacked0 = preload("res://FasesAssets/fase0.tscn")
	_setarFase(Niveis.fases[0])
	
		


func _on_botao_start_pressed() -> void:
	SomManager.click.play()
	get_tree().change_scene_to_packed(carregarScena)


func _on_fase_1_pressed() -> void:
	_setarFase(Niveis.fases[1])

func _on_fase_2_pressed() -> void:
	_setarFase(Niveis.fases[2])
	
func _on_fase_3_pressed() -> void:
	_setarFase(Niveis.fases[3])

func _on_fase_4_pressed() -> void:
	_setarFase(Niveis.fases[4])


func _on_fase_5_pressed() -> void:
	_setarFase(Niveis.fases[5])

func _on_button_pressed() -> void:
	#SomManager.click.play()
	get_tree().change_scene_to_file("res://Scenes/Menus/menu.tscn")



func _desclicarOutros(clicado: Button):
	#pra só poder clicar em um por vez
	for botao in todosBotoes:
		if botao == clicado:
			pass
		else:
			if botao.disabled:
				pass
			else:
				botao.button_pressed = false
		
func _resetTodos():
	
	numeroFaseLabel.text = "Escolha a fase"
	carregarScena = null
	
	botaoPlay.visible = false
	labelPont.visible = false
	medalhaIcone.texture = null
	_desclicarOutros(todosBotoes[5])
	for botao in todosBotoes:
		if botao.disabled:
			pass
		else:
			botao.button_pressed = false




func _setarFase(_faseClicada: fase):
	
	#se nao estava clicado
	if faseSelecionada != _faseClicada:
		faseSelecionada = _faseClicada
		#carrega sena e dados
		carregarScena = faseSelecionada.scena
		numeroFaseLabel.text = faseSelecionada.nome
		#deixa as coisa visiveis
		botaoPlay.visible = true
		labelPont.visible = true
		medalhaIcone.visible = true
		#seta o icone
		medalhaIcone.texture =medalhasSprites[faseSelecionada.melhorPontuacao]
		
		#passa o numero da fase pra desclciar os outros
		_desclicarOutros(todosBotoes[faseSelecionada.numero])
	else:
		#se estava clicado desclica
		_resetTodos()
