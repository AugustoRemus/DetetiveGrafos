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



func printar_matriz(matriz: Array) -> void:
	for linha in matriz:
		var linha_str = ""
		for valor in linha:
			linha_str += str(valor) + " "
		print(linha_str.strip_edges())  

#cuida das inteacoes, peso nas arestas pode ser feito com 
#numeros negativos pq ele testa se n é igual antes
func interacaoID(idInteracao:int):
	
	#sao da mesma cor, esta pedindo o id igual
	if(idInteracao == base_np_cs.id):
		logicaBalao.exibirBalao(0)
		#sai para n testar
		#chama funcao de fantasma da logica
		return
		
	#chama com o numero da interacao
	logicaBalao.exibirBalao(_matriz[idInteracao][base_np_cs.id])
		

	
