extends CharacterBody2D

#debug
@onready var camera_2d: Camera2D = $Camera2D



#debug
#zoom esta bugando as texturas
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Debug"):
		camera_2d.zoom -= Vector2(0.1,0.1)
