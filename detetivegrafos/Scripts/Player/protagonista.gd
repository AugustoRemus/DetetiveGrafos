extends CharacterBody2D

#debug
@onready var camera_2d: Camera2D = $Camera2D
@export var area: Area2D
@export var transformador: Node
@export var interador: Node

#id do npc transformado, vai ser um int
var idNPCTransformado = null

#debug
#zoom esta bugando as texturas
func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Debug"):
		camera_2d.zoom -= Vector2(0.1,0.1)
	
	#so tranforma se n tem ninguem pra conversar
	if Input.is_action_just_pressed("E"):
		#esta longe de qualquer um logo transforma
		if area.corpoAtual == null:
			transformador.transformar()
			
		#se esta perto ele pode conversar com o body,
		#passa o id do npc que vai transformar
		else:
			#se tiver algo no id 
			if (idNPCTransformado!= null):
				interador.gerarInteracao(area.corpoAtual, idNPCTransformado)
			else:
				#se n nao pode conversar
				print("sou fantasma")
			
