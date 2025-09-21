extends Panel

@onready var conformar_desistir: Panel = $"."


func _on_desistir_pressed() -> void:
	visible = true


func _on_sim_desistir_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menus/menu.tscn")


func _on_nao_desistir_pressed() -> void:
	conformar_desistir.visible = false
