extends Control

var carregarScena = null

@export var numeroFaseLabel : Label
@export var botaoPlay:Button
@export var labelFDS: Label

@export var gridContainerBotoesLvl: GridContainer

@export var medalhaIcone: TextureRect
@export var medalhasSprites: Array[Texture2D]


func _ready() -> void:
	#testa quais ele pode jogar
	for fase in range(Niveis.quantNiveis):
		if Niveis.fasesPontos[fase] == -1:
			var _botao = gridContainerBotoesLvl.get_child(fase - 1)
			
			_botao.disabled = true
		
		


func _on_fase_0_pressed() -> void:
	carregarScena = "res://Scripts/Fase/FasesAssets/fase0.tscn"
	numeroFaseLabel.text = "tutorial"
	botaoPlay.visible = true
	medalhaIcone.texture =medalhasSprites[ Niveis.fasesPontos[0]] 
	SomManager.click.play()
	


func _on_botao_start_pressed() -> void:
	SomManager.click.play()
	get_tree().change_scene_to_file(carregarScena)


func _on_fase_1_pressed() -> void:
	carregarScena = "res://Scripts/Fase/FasesAssets/fase_1.tscn"
	numeroFaseLabel.text = "fase 1"
	botaoPlay.visible = true
	medalhaIcone.texture =medalhasSprites[ Niveis.fasesPontos[1]]
	SomManager.click.play()

func _on_fase_2_pressed() -> void:
	carregarScena = "res://Scripts/Fase/FasesAssets/fase_2.tscn"
	numeroFaseLabel.text = "fase 2"
	botaoPlay.visible = true
	medalhaIcone.texture =medalhasSprites[ Niveis.fasesPontos[2]]
	SomManager.click.play()


func _on_fase_3_pressed() -> void:
	carregarScena = "res://Scripts/Fase/FasesAssets/fase_3.tscn"
	numeroFaseLabel.text = "fase 3"
	botaoPlay.visible = true
	medalhaIcone.texture =medalhasSprites[ Niveis.fasesPontos[3]]
	SomManager.click.play()


func _on_fase_4_pressed() -> void:
	carregarScena = "res://Scripts/Fase/FasesAssets/fase_4.tscn"
	numeroFaseLabel.text = "fase 4"
	botaoPlay.visible = true
	medalhaIcone.texture =medalhasSprites[ Niveis.fasesPontos[4]]
	SomManager.click.play()



func _on_fase_5_pressed() -> void:
	carregarScena = "res://Scripts/Fase/FasesAssets/fase_5.tscn"
	numeroFaseLabel.text = "fase 5"
	botaoPlay.visible = true
	medalhaIcone.texture =medalhasSprites[ Niveis.fasesPontos[5]]
	SomManager.click.play()


func _on_button_pressed() -> void:
	SomManager.click.play()
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
