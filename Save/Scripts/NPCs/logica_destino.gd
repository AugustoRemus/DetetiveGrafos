extends Node

var lastPoint : Node2D = null

@export var npc = CharacterBody2D

# nodosDestino   é o nome do array

#retorna uma posicao (vector 2) para onde o npc tem q andar
func getNewPoit():
	#caso tenha apenas 1 nodo ou nenhum ele vai retornar
	#q a nova posicao é a que ele esta agora para ele
	#ficar parado
	if npc.nodosDestino.size() <= 1:
		return npc.position
		
	#so sai quando der um return
	while true:
		#cria novo nodo
		var newPos:Node2D
		#pega um aleatorio
		newPos = npc.nodosDestino.pick_random()
		
		#se for diferente do antigo 
		#isso pode dar pau
		if lastPoint != newPos:
			#o antigo vira atual
			lastPoint = newPos
			#retorna o novo
			return newPos.position
			
		
		
		
