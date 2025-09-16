extends Node
@export var player: CharacterBody2D
@export var sprite: Sprite2D

#adicionar corrida?


#este script cuida da movimentação e animação de movimentação do jogador


#region moveVars

#chama a funcao mov a cada frame pra calcular a direçao q vai andar
var direcao : Vector2

#pega a speed do player
#quando tiver upgrades testar a logica para pegar o certo
var Speed: float = 500 #pra debugar
#GlobalPlayer.velocidadeMovimentoPlayer

#arrumar depois pra ver como fica mais agradavel
@export_range(0.0001, 0.9999) var aceleration: float
@export_range(0.0001, 0.9999) var fric : float


#endregion





func _init() -> void:

	pass



func _physics_process(delta):
	_move()
	#quando andar faz a animação
	sprite._animation(direcao,delta)
	#play audio de passos
	#botar um teste para o player nao conseguir sair do mapa
	
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
	
