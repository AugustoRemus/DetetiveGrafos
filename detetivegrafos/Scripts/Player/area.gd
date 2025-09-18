extends Area2D


@export var player: CharacterBody2D

#guarda o corpo atual pra desmarcar se vier um novo
var corpoAtual: CharacterBody2D

#nodo para cuidar das tags
@export var tags:Node2D

#esta parte ele apenas cuida quem ele pode pegar, nao qual ele realmente
#vai pegar

@export var transformadorNode: Node

func _ready() -> void:
	_on_tester_timeout()

func getAtual():
	return(corpoAtual)


#testa a cada alguns milesiomos para n ser mt pesado
func _on_tester_timeout() -> void:
	#pega todos os body dentro
	var todos = get_overlapping_bodies()
	#cria novo aray
	var corpos: Array = []
	#bota os alvos no novo aray
	for corpo in todos:
		if corpo.is_in_group("Alvo"):
			corpos.append(corpo)
	
	#reinicia silhueta
	if corpoAtual != null:
		corpoAtual.silhueta(0)
		
		#n ta vazio
	if corpos.size() == 0:
		corpoAtual = null
		#n tem ninguem perto, n da pra fazer nada
		tags.attLegenda(false)
		#print("ninguem por perto!")
		return
	
	
	# inicia zerado
	var menorDist = null
	
	#para cada corpo
	for corpo in corpos:
		#caso inicial
		if menorDist == null:
			menorDist = corpo.global_position.distance_to(player.global_position)
			
			corpoAtual = corpo
			
		else:
			#calcula distancia
			var distanciaAtual = corpo.global_position.distance_to(player.global_position)
			#se for menor muda o corpo atual
			if distanciaAtual < menorDist:
				
				
				corpoAtual = corpo
				menorDist = distanciaAtual
		
	if corpoAtual != null:
		#mostra a silhueta do corpo atual
		#caso for null mudar na iu oq da pra fazer
		corpoAtual.silhueta(1)
		tags.attLegenda(true)
		
	#tem alguem perto


	

		
	
