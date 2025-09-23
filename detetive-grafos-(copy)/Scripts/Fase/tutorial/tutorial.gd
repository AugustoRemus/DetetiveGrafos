extends CanvasLayer

@onready var panel: Panel = $Panel

func _on_tutorial_2_pressed() -> void:
	panel.visible = !panel.visible
	pass # Replace with function body.
