extends Control


func _on_jogar_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/seletor_fases.tscn")
	




func _on_config_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/config.tscn")



func _on_sair_pressed() -> void:
	get_tree().quit()
	
