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
	
	#se o corpo atual n é null e ta fora da area desmarca
	if corpoAtual != null and !corpos.has(corpoAtual):
		corpoAtual.silhueta(0)
		corpoAtual == null
	
	#reinicia silhueta
	if corpoAtual != null:
		corpoAtual.silhueta(0)
		
	
	# inicia zerado
	var menorDist = null
	
	#n ta vazio
	if corpos.size() == 0:
		return
		
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
	corpoAtual.silhueta(1)
