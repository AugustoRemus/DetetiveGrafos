extends Control


func _on_fase_1_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/DebugTeste/fase_debug.tscn")


func _on_fase_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scripts/Fase/FasesAssets/fase0.tscn")
