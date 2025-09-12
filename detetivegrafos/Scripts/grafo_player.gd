extends CanvasLayer



func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Espaco"): 
		if !visible:
			
			visible = true
		else:
			visible = false
		
