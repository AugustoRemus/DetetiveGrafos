extends Panel

@onready var confirmarEntrega: Panel = $"."




func _on_nao_entrega_pressed() -> void:
	confirmarEntrega.visible = false



func _on_entregar_2_pressed() -> void:
		visible = true
