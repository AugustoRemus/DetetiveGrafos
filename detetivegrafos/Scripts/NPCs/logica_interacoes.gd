extends Node
@onready var base_np_cs: NPCClasse = $".."

#matriz
var _matriz

#id
var _id

#seta o valor do id
func _ready() -> void:
	setId()


#seta valor id
func setId():
	_id = base_np_cs.id


#copia matriz
func setMatriz(MatrizNpc):
	#copia a matriz
	_matriz = MatrizNpc.duplicate(true)
	
	printar_matriz(_matriz)



func printar_matriz(matriz: Array) -> void:
	for linha in matriz:
		var linha_str = ""
		for valor in linha:
			linha_str += str(valor) + " "
		print(linha_str.strip_edges())  
