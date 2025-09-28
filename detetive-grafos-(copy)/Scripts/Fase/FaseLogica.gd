extends Node2D

##lista de todos os NPCs

var ListaNPCs: Array[NPCClasse]

@onready var grafo_player: CanvasLayer = $grafoPlayer

##nivel atual
@export var lvlAtual : int

##script com afunçao de criação da matriz
@export var scriptCriacaoGrafo: Script

##vai ser a matriz que tem as relaçoes
var matrizNPCs 

#objeto que vai ser criado para chamar a função do script
var scriptCarregadoLogica

var faseClasse: fase

@onready var timer: CanvasLayer = $timer



func _ready() -> void:
	faseClasse = Niveis.fases[lvlAtual]
	setarTimer()

	Niveis.faseAtual = faseClasse
	
	scriptCarregadoLogica = scriptCriacaoGrafo.new()
	#pega os filhos do nodo dos npcs
	ListaNPCs.clear()
	
	

	#pega todos os npcs da fase
	var _listaTemp = get_tree().get_nodes_in_group("NPCs")
	
	for _npc in _listaTemp:
		if _npc is NPCClasse:
			ListaNPCs.append(_npc)
			
	#print(ListaNPCs)
	
	
	#sorteia os id pros jogadores
	marcadoID()
	#cria a matriz chamando a função desse script
	matrizNPCs = scriptCarregadoLogica.CriarGrafo(ListaNPCs)
	startNPCs()
	
	#printar_matriz(matrizNPCs)
	
func notficacao():
	grafo_player.ligarNot()
	
func marcadoID():
	#sortei os ids
	var contador = 0
	for npc in ListaNPCs:
		npc.setID(contador)
		#print(npc.nomeCor)teraçoes.setMatriz(matrizNPCs)
			#print(npc.nomeCor)
		#print(npc.id)
		contador+= 1
		
func startNPCs():
	#printar_matriz(matrizNPCs)
	for npc in ListaNPCs:
		npc.LogicaInteraçoes.setMatriz(matrizNPCs)

func finalizou(_matriz):
	#botar um cronometro com o tempo da animação e
	#no final botar esse resto d codigo:
	
	Matrizes.MatrizCerta = matrizNPCs
	Matrizes.MatrizPlayer = _matriz
	get_tree().change_scene_to_file("res://Scenes/Menus/resultados.tscn")
	

func setarTimer():
	var _todos = get_children()
	for nodo in _todos:
		if nodo.name == "timer":
			#print(faseClasse.tempo)
			
			nodo.setTimer(float(faseClasse.tempo))
