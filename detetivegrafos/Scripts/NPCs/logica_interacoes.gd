extends Node
@onready var base_np_cs: NPCClasse = $".."

@export var logicaBalao: Sprite2D

@export var interacaoPositiva: interacao
@export var interacaoNegativa: interacao


#matriz
var _matriz


#copia matriz
func setMatriz(MatrizNpc, size: int):
	
	_matriz = MatrizNpc.duplicate()
	

	

#recebe um pedido de interacao
func interacaoID(idInteracao:int):
	
	var myId = base_np_cs.id
	
	if _matriz[myId][idInteracao] == "x":
		logicaBalao.exibirBalao(interacaoNegativa)
	elif _matriz[myId][idInteracao] == "0":
		logicaBalao.exibirBalao(interacaoNegativa)
	elif _matriz[myId][idInteracao] == "1":
		logicaBalao.exibirBalao(interacaoPositiva)
	
	
		
	

	
