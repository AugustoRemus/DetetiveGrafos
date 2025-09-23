extends CanvasLayer

@onready var panel: Panel = $Panel

@onready var tutorial_2: Button = $tutorial2

var aberto = true

func _on_tutorial_2_pressed() -> void:
	panel.visible = !panel.visible
	if aberto:
		tutorial_2.text = "tutorial"
		
	if !aberto:
		tutorial_2.text = "fechar"
		
	aberto = !aberto
	pass # Replace with function body.
