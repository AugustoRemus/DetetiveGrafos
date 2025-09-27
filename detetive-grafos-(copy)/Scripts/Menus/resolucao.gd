extends Control

@onready var salvador: Timer = $salvador
@onready var salvar_pergunta: Panel = $salvarPergunta


const BASE_RES = Vector2i(640, 360)

func _set_resolution(multiplier: int):
	var new_size = BASE_RES * multiplier
	
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	
	#tamanho da tela ajustado
	DisplayServer.window_set_size(new_size)
	
	#metade do monitor
	var screen_size = DisplayServer.screen_get_size() 
	var new_position = (screen_size - new_size) / 2
	DisplayServer.window_set_position(Vector2i(new_position.x, new_position.y))
	
	
	
	salvador.start(5)
	salvar_pergunta.visible = true
	




#640 x 360

func _on_r_0_pressed() -> void:
	_set_resolution(1)


#1280x720
func _on_r_1_pressed() -> void:
	_set_resolution(2)

#1920x1080
func _on_r_2_pressed() -> void:
	_set_resolution(3)

#2560x1440
func _on_r_3_pressed() -> void:
	_set_resolution(4)




func _on_full_scren_pressed() -> void:
	if DisplayServer.window_get_mode() == DisplayServer.WINDOW_MODE_FULLSCREEN:
		
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	else:
		
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		
	
		var screen_size = DisplayServer.screen_get_size()
		
		#MAIOR VALOR Q DA
		var multiplier = min(screen_size.x / BASE_RES.x, screen_size.y / BASE_RES.y)
		multiplier = max(1, int(multiplier))
		
		
		get_viewport().size = BASE_RES * multiplier
		
		salvador.start(5)
		salvar_pergunta.visible = true


func _on_salvador_timeout() -> void:
	_set_resolution(1)
	salvar_pergunta.visible = false

func _on_sim_pressed() -> void:
	salvador.stop()
	salvar_pergunta.visible = false


func _on_nao_pressed() -> void:
	salvador.stop()
	_set_resolution(1)
	salvar_pergunta.visible = false
