extends Control

@export var controleVolume: Control

@export var controlVolumeMusica: Control

@export var dificuldades: Array[CheckBox]

func _ready() -> void:
	controleVolume.value = SomManager.volume
	controlVolumeMusica.value = SomManager.volumeMusica
	_setDificultStart()

func _on_button_pressed() -> void:
	#SomManager.click.play()
	get_tree().change_scene_to_file("res://Scenes/Menus/menu.tscn")


func _on_h_slider_value_changed(value: float) -> void:
	SomManager.click.play()
	SomManager.atualizar_volume(value)
	
	
	
func _setDificultStart():
	for checkBox in dificuldades:
		checkBox.button_pressed = false
	dificuldades[Niveis.dificuldade].button_pressed = true
	pass
	
func _setDificult(dif):
	
	for i in dificuldades.size():
		if i == dif:
			pass
		else:
			dificuldades[i].button_pressed = false
	Niveis.dificuldade = dif
	
	


func _on_facil_pressed() -> void:
	SomManager.botao_dif_izi.play()
	_setDificult(0)


func _on_medio_pressed() -> void:
	SomManager.botao_dif_medio.play()
	_setDificult(1)


func _on_dificiç_pressed() -> void:
	SomManager.botao_dif_hard.play()
	_setDificult(2)


func _on_musica_slider_value_changed(value: float) -> void:
	SomManager.atualizar_volume_musica(value)
