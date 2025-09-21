extends Node

var pontosAndaveis: Array[Vector2]

func _setarPontos(_numerosDestino: int, _arrayPontos: Array[Node]):
	#pra quantia de numeros sortei pontos diferentes da lista
	var newArray = _arrayPontos.duplicate()
	
	for i in range(_numerosDestino):
		
		
		var _newpoint = newArray.pick_random()
		newArray.erase(_newpoint)
		
		pontosAndaveis.append(_newpoint.position)







#retorna uma posicao (vector 2) para onde o npc tem q andar
func getNewPoit():
	return pontosAndaveis.pick_random()
	
