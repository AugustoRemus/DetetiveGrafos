extends Button

@export var hoverScale: Vector2 = Vector2(1.1,1.1)
@export var pressedScale: Vector2 = Vector2(0.9,0.9)




func _ready() -> void:
	#conecta os botao
	pressed.connect(_on_pressed)
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(buttonExit)

	call_deferred("_initPivot")

func _on_pressed() -> void:
	SomManager.click.play()
	var button_press_tween: Tween = create_tween()
	
	button_press_tween.tween_property(self,"scale",pressedScale,0.06).set_trans(Tween.TRANS_SINE)
	button_press_tween.tween_property(self,"scale",hoverScale,0.12).set_trans(Tween.TRANS_SINE)

	
	
func buttonExit() -> void:
	if !disabled:
		#som disabled?
		pass
	create_tween().tween_property(self,"scale",Vector2.ONE, 0.1,).set_trans(Tween.TRANS_SINE)
	
	


func _on_mouse_entered() -> void:
	if !disabled:
		SomManager.hover.play()
	
	create_tween().tween_property(self,"scale",hoverScale, 0.1,).set_trans(Tween.TRANS_SINE)
	

func _initPivot():
	pivot_offset = size/2

func tremidinha():
	pass
