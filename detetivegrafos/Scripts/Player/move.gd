extends Node

@export var player: CharacterBody2D




#region moveVars

#chama a funcao mov a cada frame pra calcular a direçao q vai andar
var direcao : Vector2

#pega a speed do player
#quando tiver upgrades testar a logica para pegar o certo
var Speed: float = GlobalPlayer.velocidadeMovimentoPlayer


@export_range(0.0001, 0.9999) var aceleration: float
@export_range(0.0001, 0.9999) var fric : float


#endregion

func _init() -> void:

	pass



func _physics_process(delta):
	_move()
	player.move_and_slide()
	

func _move():
	#pega a direção que ele deve ir
	direcao.x = Input.get_axis("L","R")
	direcao.y = Input.get_axis("up","down")

	#ele aplica a desaceleração caso n tenho input
	if direcao != Vector2.ZERO:
		player.velocity.x = lerp(player.velocity.x, direcao.normalized().x * Speed, aceleration)
		player.velocity.y = lerp(player.velocity.y, direcao.normalized().y * Speed, aceleration)
		
		#sai da funcao de movimentação
		return
		
	#aplica a aceleração
	player.velocity.x = lerp(player.velocity.x, direcao.normalized().x * Speed, fric)
	player.velocity.y = lerp(player.velocity.y, direcao.normalized().y * Speed, fric)
	
	
