extends Control

var carregarScena: PackedScene

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
		if Niveis.fasesPontos[fase] == -1:
			var _botao = gridContainerBotoesLvl.get_child(fase - 1)
			
			_botao.disabled = true
		
		



func _on_fase_0_pressed() -> void:
	
	var scenaPacked0 = preload("res://FasesAssets/fase0.tscn")
	_setarFase("tutorial",0, scenaPacked0)
	
		


func _on_botao_start_pressed() -> void:
	SomManager.click.play()
	get_tree().change_scene_to_packed(carregarScena)


func _on_fase_1_pressed() -> void:
	var scenaPacked0 = preload("res://FasesAssets/fase_1.tscn")
	_setarFase("fase 1",1, scenaPacked0)
	

func _on_fase_2_pressed() -> void:
	var scenaPacked0 = preload("res://FasesAssets/fase_2.tscn")
	_setarFase("fase 2",2, scenaPacked0)

func _on_fase_3_pressed() -> void:
	var scenaPacked0 = preload("res://FasesAssets/fase_3.tscn")
	_setarFase("fase 3",3, scenaPacked0)


func _on_fase_4_pressed() -> void:
	var scenaPacked0 = preload("res://FasesAssets/fase_4.tscn")
	_setarFase("fase 4",4, scenaPacked0)



func _on_fase_5_pressed() -> void:
	var scenaPacked0 = preload("res://FasesAssets/fase_5.tscn")
	_setarFase("fase 5",5, scenaPacked0)


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




func _setarFase(_nomeFase: String,_numeroFase:int, _packedScene: PackedScene):
	
	#se nao estava clicado
	if numeroFaseLabel.text != _nomeFase:
		#carrega sena e dados
		carregarScena = _packedScene
		numeroFaseLabel.text = _nomeFase
		#deixa as coisa visiveis
		botaoPlay.visible = true
		labelPont.visible = true
		medalhaIcone.visible = true
		#seta o icone
		medalhaIcone.texture =medalhasSprites[ Niveis.fasesPontos[_numeroFase]]
		
		_desclicarOutros(todosBotoes[_numeroFase])
	else:
		#se estava clicado desclica
		_resetTodos()
