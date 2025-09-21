extends Node

var pontosAndaveis: Array[Vector2]

var numAtual = 0


func _setarPontos(_numerosDestino: int, _arrayPontos):
	print(_arrayPontos)
	#pra quantia de numeros sortei pontos diferentes da lista

	var newArray = _arrayPontos.duplicate()
	
	for ponto in newArray:
		pontosAndaveis.append(ponto.position)
	

#retorna uma posicao (vector 2) para onde o npc tem q andar
func getNewPoit():
	
	numAtual = numAtual + 1
	
	if numAtual >= pontosAndaveis.size():
		numAtual = 0
		
	return pontosAndaveis[numAtual]
