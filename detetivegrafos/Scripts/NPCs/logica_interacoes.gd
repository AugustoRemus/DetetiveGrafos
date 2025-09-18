extends Node
@onready var base_np_cs: NPCClasse = $".."

@export var logicaBalao: Sprite2D

#matriz
var _matriz


#copia matriz
func setMatriz(MatrizNpc):
	#copia a matriz
	_matriz = MatrizNpc.duplicate(true)
	
	#printar_matriz(_matriz)



#recebe um pedido de interacao
func interacaoID(idInteracao:int):
	
	var myId = base_np_cs.id
	
	#sao da mesma cor, esta pedindo o id igual
	if(idInteracao == base_np_cs.id):
		logicaBalao.exibirBalao(0)
		#sai para n testar
		#chama funcao de fantasma da logica
		return
		
	#chama com o numero da interacao
	#logicaBalao.exibirBalao(int(_matriz[idInteracao][]))
		

	
