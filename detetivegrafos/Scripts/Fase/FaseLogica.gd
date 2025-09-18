extends Node2D

##lista de todos os NPCs
var ListaNPCs: Array[NPCClasse]

##nivel atual
@export var lvlAtual : int

##nodo aonde estao os npcs
@export var nodoNPCs: Node

##script com afunçao de criação da matriz
@export var scriptCriacaoGrafo: Script

##vai ser a matriz que tem as relaçoes
var matrizNPCs 

#objeto que vai ser criado para chamar a função do script
var scriptCarregadoLogica

func _ready() -> void:
	Niveis.faseAtual = lvlAtual
	scriptCarregadoLogica = scriptCriacaoGrafo.new()
	#pega os filhos do nodo dos npcs
	ListaNPCs.clear()
	
	var nodosFilhos = nodoNPCs.get_children()
	#adiciona cada filho individualmente
	for filho in nodosFilhos:
		if filho != null:
			ListaNPCs.append(filho)
	#ListaNPCs = 
	
	
	
	#sorteia os id pros jogadores
	marcadoID()
	#cria a matriz chamando a função desse script
	matrizNPCs = scriptCarregadoLogica.CriarGrafo(ListaNPCs)
	startNPCs()
	
	#printar_matriz(matrizNPCs)
	
	
	
func marcadoID():
	#sortei os ids
	var contador = 0
	for npc in ListaNPCs:
		npc.setID(contador)
		#print(npc.nomeCor)
		#print(npc.id)
		contador+= 1
		
		
func printar_matriz(matriz: Array) -> void:
	for linha in matriz:
		var linha_str = ""
		for valor in linha:
			linha_str += str(valor) + " "
		print(linha_str.strip_edges())  

func startNPCs():
	#printar_matriz(matrizNPCs)
	for npc in ListaNPCs:
		npc.LogicaInteraçoes.setMatriz(matrizNPCs)

func finalizou(_matriz):
	#botar um cronometro com o tempo da animação e
	#no final botar esse resto d codigo:
	Matrizes.MatrizCerta = matrizNPCs
	Matrizes.MatrizPlayer = _matriz
	get_tree().change_scene_to_file("res://Scenes/resultados.tscn")
	
