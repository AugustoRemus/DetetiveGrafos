extends Node

@onready var base_np_cs: NPCClasse = $"../.."


func _setarPontos(_numerosDestino: int, _arrayPontos):
	pass
	

#retorna uma posicao (vector 2) para onde o npc tem q andar
func getNewPoit():
	
	return base_np_cs.position
