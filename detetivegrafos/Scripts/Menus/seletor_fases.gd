extends Control

var carregarScena = null

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
	if numeroFaseLabel.text != "tutorial":
		carregarScena = "res://FasesAssets/fase0.tscn"
		numeroFaseLabel.text = "tutorial"
		botaoPlay.visible = true
		labelPont.visible = true
		medalhaIcone.texture =medalhasSprites[ Niveis.fasesPontos[0]] 
		#SomManager.click.play()
		_desclicarOutros(todosBotoes[0])
	else:
		_resetTodos()
		


func _on_botao_start_pressed() -> void:
	SomManager.click.play()
	get_tree().change_scene_to_file(carregarScena)


func _on_fase_1_pressed() -> void:
	if numeroFaseLabel.text != "fase 1":
		carregarScena = "res://FasesAssets/fase_1.tscn"
		numeroFaseLabel.text = "fase 1"
		botaoPlay.visible = true
		labelPont.visible = true
		medalhaIcone.texture =medalhasSprites[ Niveis.fasesPontos[1]]
		#SomManager.click.play()
		_desclicarOutros(todosBotoes[1])
	else:
		_resetTodos()

func _on_fase_2_pressed() -> void:
	if numeroFaseLabel.text != "fase 2":
		carregarScena = "res://FasesAssets/fase_2.tscn"
		numeroFaseLabel.text = "fase 2"
		botaoPlay.visible = true
		labelPont.visible = true
		medalhaIcone.texture =medalhasSprites[ Niveis.fasesPontos[2]]
		#SomManager.click.play()
		_desclicarOutros(todosBotoes[2])
	else:
		_resetTodos()

func _on_fase_3_pressed() -> void:
	if numeroFaseLabel.text != "fase 3":
		
		carregarScena = "res://FasesAssets/fase_3.tscn"
		numeroFaseLabel.text = "fase 3"
		botaoPlay.visible = true
		labelPont.visible = true
		medalhaIcone.texture =medalhasSprites[ Niveis.fasesPontos[3]]
		_desclicarOutros(todosBotoes[3])
		#SomManager.click.play()
	else:
		_resetTodos()


func _on_fase_4_pressed() -> void:
	if numeroFaseLabel.text != "fase 4":
		carregarScena = "res://FasesAssets/fase_4.tscn"
		numeroFaseLabel.text = "fase 4"
		botaoPlay.visible = true
		labelPont.visible = true
		medalhaIcone.texture =medalhasSprites[ Niveis.fasesPontos[4]]
		_desclicarOutros(todosBotoes[4])
		#SomManager.click.play()
	else:
		_resetTodos()



func _on_fase_5_pressed() -> void:
	if numeroFaseLabel.text != "fase 5":
		carregarScena = "res://FasesAssets/fase_5.tscn"
		numeroFaseLabel.text = "fase 5"
		botaoPlay.visible = true
		labelPont.visible = true
		medalhaIcone.texture =medalhasSprites[ Niveis.fasesPontos[5]]
		_desclicarOutros(todosBotoes[5])
	else:
		_resetTodos()


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
	carregarScena = "null"
	
	botaoPlay.visible = false
	labelPont.visible = false
	medalhaIcone.texture = null
	_desclicarOutros(todosBotoes[5])
	for botao in todosBotoes:
		if botao.disabled:
			pass
		else:
			botao.button_pressed = false
