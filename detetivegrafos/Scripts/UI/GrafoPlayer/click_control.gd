extends Control

@export var container: Control

var botoes: Array[TextureButton]

var botaoClicado: TextureButton



func _on_circular_container_botao_clicado(botao: Variant) -> void:
	print(botao.id)
