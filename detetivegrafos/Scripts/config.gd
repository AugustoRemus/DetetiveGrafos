extends Control

@export var controleVolume: Control


func _ready() -> void:
	controleVolume.value = SomManager.volume

func _on_button_pressed() -> void:
	SomManager.click.play()
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")


func _on_h_slider_value_changed(value: float) -> void:
	SomManager.atualizar_volume(value)
