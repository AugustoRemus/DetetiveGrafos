extends Control


func _ready() -> void:
	get_tree().get_root().set_transparent_background(true)

func _on_jogar_pressed() -> void:
	#SomManager.click.play()
	get_tree().change_scene_to_file("res://Scenes/Menus/seletor_fases.tscn")
	




func _on_config_pressed() -> void:
	#SomManager.click.play()
	get_tree().change_scene_to_file("res://Scenes/Menus/config.tscn")



func _on_sair_pressed() -> void:
	get_tree().quit()
	


func _on_button_pressed() -> void:
	#SomManager.click.play()
	pass # Replace with function body.


func _on_hats_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menus/chapeus.tscn")
	pass # Replace with function body.
