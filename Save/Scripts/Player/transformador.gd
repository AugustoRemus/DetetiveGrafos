extends Node
@export var sprite: Sprite2D
@export var area : Area2D
@onready var player: CharacterBody2D = $".."
@export var hatSpritePlayer: Sprite2D
@export var tags: Node2D

@export var labelCor: Label
#quando clicar E vai se transformar nesse
#adicionar quadrado no canto para saber em qual cor
#vc pode se transformar no caso essa cor aqui


#quando clica Q ele separa esse pra se transformar
func _input(event: InputEvent) -> void:
	#pega um possivel candidato para salvar a cor
	if Input.is_action_just_pressed("Q"):
		if area.corpoAtual and area.corpoAtual.id!=player.idNPCTransformado:
			transformar(area.corpoAtual)
			
			#player.possoTransformar = true
		else:
			SomManager.erro.play()
			
	var _tiraWarning = event
	_tiraWarning = "afe"
			
	#se transforma na cor, porem apenas se ele n estiver perto de alguem
	#pensar como posso fazer isso ou adicionar outra tecla
	
	#passar o teste de input para cima e fazer o teste da area
	#para ver se n tem alguem

func transformar(corpo):
	if corpo:
		sprite.texture = corpo.sprite.texture
	
		#atualiza ui
		tags.attTransformacao(corpo)
		
		
		#inutil por enquanto
		if corpo.hat:
			hatSpritePlayer.texture = corpo.hat.sprite
			player.hatTransformado = corpo.hat
		else:
			hatSpritePlayer.texture = null
			player.hatTransformado = null
			
		player.idNPCTransformado = corpo.id
		SomManager.transformacao.play()
		
	else:
		#print("n da pra se transformar")
		SomManager.erro_2.play()
	
		
		
		
