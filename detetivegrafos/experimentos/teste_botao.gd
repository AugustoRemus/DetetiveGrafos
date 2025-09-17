extends Button


func _ready() -> void:
	#conecta os botao
	pressed.connect(_on_pressed)
	mouse_entered.connect(_on_mouse_entered)

func _on_pressed() -> void:
	SomManager.click.play()


func _on_mouse_entered() -> void:
	if !disabled:
		SomManager.click.play()
