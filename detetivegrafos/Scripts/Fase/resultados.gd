extends Control
@onready var debug: Label = $Label

@export var voltarBotao: Button





func _ready() -> void:
	debug.text = str(Matrizes.calcularErro())


func _on_voltar_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/menu.tscn")
