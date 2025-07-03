extends CharacterBody2D

#debug
@onready var camera_2d: Camera2D = $Camera2D
@export var area: Area2D
@export var transformador: Node



#debug
#zoom esta bugando as texturas
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Debug"):
		camera_2d.zoom -= Vector2(0.1,0.1)
	
	#so tranforma se n tem ninguem pra conversar
	if Input.is_action_just_pressed("E"):
		#esta longe de qualquer um
		if area.corpoAtual == null:
			transformador.transformar()
			
		else:
			#conversa
			print(area.corpoAtual)
			
