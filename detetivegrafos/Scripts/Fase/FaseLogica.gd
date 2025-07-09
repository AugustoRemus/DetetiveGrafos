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
	print(matrizNPCs)
	
	
func marcadoID():
	#sortei os ids
	var contador = 0
	for npc in ListaNPCs:
		npc.id = contador
		contador+= 1
