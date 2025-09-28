extends CanvasLayer

@onready var panel: Panel = $Panel

@onready var espaço: AnimatedSprite2D = $espaço


func _on_player_transformei_tutorial() -> void:
	SomManager.click.play()
	espaço.play("E")


func _on_player_interagi_com(npc: Variant) -> void:
	SomManager.click.play()
	espaço.play("Espaco")


func _on_grafo_player_mudei_valor_tutorial() -> void:
	SomManager.click.play()
	queue_free()
