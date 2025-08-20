extends Node
@export var sprite: Sprite2D
@export var area : Area2D
@onready var player: CharacterBody2D = $".."

@export var tags: Node2D

#quando clicar E vai se transformar nesse
#adicionar quadrado no canto para saber em qual cor
#vc pode se transformar no caso essa cor aqui
var podeTransformar: CharacterBody2D

#quando clica Q ele separa esse pra se transformar
func _input(event: InputEvent) -> void:
	#pega um possivel candidato para salvar a cor
	if Input.is_action_just_pressed("Q"):
		if area.corpoAtual:
			podeTransformar = area.corpoAtual
			
			#player.possoTransformar = true
		else:
			#barulho erro
			print("nada perto")
			
	#se transforma na cor, porem apenas se ele n estiver perto de alguem
	#pensar como posso fazer isso ou adicionar outra tecla
	
	#passar o teste de input para cima e fazer o teste da area
	#para ver se n tem alguem
	
func transformar():
	if podeTransformar:
		sprite.texture = podeTransformar.sprite.texture
		player.idNPCTransformado = podeTransformar.id
		podeTransformar = null
		tags.transformarLabel(false)
		#player.possoTransformar = false
	else:
		print("n da pra se transformar")
		#barulho erro
		
		
		
