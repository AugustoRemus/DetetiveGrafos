extends Area2D
@export var player: CharacterBody2D
#guarda o corpo atual pra desmarcar se vier um novo
var corpoAtual: CharacterBody2D

#esta parte ele apenas cuida quem ele pode pegar, nao qual ele realmente
#vai pegar

#pode consumir mt recursos eu acho
func _physics_process(delta: float) -> void:
	pass

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
		#o jogador n tem ninguem perto para conversar nem roubar
		#player.possoConversar = false
		#player.possoRoubarCor = false
		
		#se n tem o id é pq ele n tem cor pra roubar
		#if(player.idNPCTransformado != null):
		#	player.possoTranformar = true
		#else:
		#	player.possoTranformar = false
			
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
		
	#mostra a silhueta do corpo atual
	#caso for null mudar na iu oq da pra fazer
	corpoAtual.silhueta(1)
	
	#tem alguem perto para roubar
	#player.possoRoubarCor = true
	#player.possoConversar = true
	#player.possoTransformar = false
