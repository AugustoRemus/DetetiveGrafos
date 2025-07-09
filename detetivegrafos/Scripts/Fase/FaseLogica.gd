extends Node2D
##lista de todos os NPCs
@export var ListaNPCs: Array[NPCClasse]

##vai receber um nodo de logica, aleatorio ou pré selecionado
@export var logicaRelacoes: Node

##vai ser a matriz que tem as relaçoes
var matrizNPCs 

func _ready() -> void:
	marcadoID()
	matrizNPCs = logicaRelacoes.CriarGrafo(ListaNPCs)
	startNPCs()
	
	#printar_matriz(matrizNPCs)
	
	
	
func marcadoID():
	#sortei os ids
	var contador = 0
	for npc in ListaNPCs:
		npc.id = contador
		contador+= 1
		
		
func printar_matriz(matriz: Array) -> void:
	for linha in matriz:
		var linha_str = ""
		for valor in linha:
			linha_str += str(valor) + " "
		print(linha_str.strip_edges())  

func startNPCs():
	#ta dando erro aqui, n ta passando
	for npc in ListaNPCs:
		npc.LogicaInteraçoes.setMatriz(matrizNPCs)
		
