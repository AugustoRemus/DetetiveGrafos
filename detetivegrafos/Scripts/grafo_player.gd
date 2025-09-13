extends CanvasLayer

@export var vertice : PackedScene = preload("res://Scenes/Grafo/vertice.tscn")

@export var nodoDosNPC: Node
var NPCS: Array[Node]

var _matrizPlayer

@export var arestaManager: Node


@export var circularContainer: Control

var _NPC1Aresta = null
#var _NPC2Aresta = null

func _ready() -> void:
	pegaOsNPCs()
	startGrafo()
	_Teste_CriarFIlhos()
	circularContainer.organizar_em_circulo()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Espaco"): 
		if !visible:
			
			visible = true
		else:
			visible = false

func pegaOsNPCs():
	NPCS = nodoDosNPC.get_children()

func startGrafo():
	#tanto de players
	var n = NPCS.size()
	#começa zerada
	var matriz_adjacencia = []

	#inicializa com zero
	for i in range(n):
		#cria linha zerada
		var linha = []
		
		#pra cada coluna
		for j in range(n):
			#se for o mesmo numero (diagonal) bota x
			if (j == i):
				linha.append("x")
			#se n zero
			else:
				linha.append("0")
		#adiciona a linha
		matriz_adjacencia.append(linha)
	_matrizPlayer = matriz_adjacencia

func _Teste_CriarFIlhos():
	var contador = 0
	for filho in NPCS:
		var botao = vertice.instantiate()
		
		botao.setarTextura(NPCS[contador].resourceNPC)
		contador+= 1
		circularContainer.add_child(botao) 
	


func _on_entregar_pressed() -> void:
	get_parent().finalizou()




func addAresta(numeroIdNPC):
	#se só tem 1 clicado
	if _NPC1Aresta == null:
		_NPC1Aresta = numeroIdNPC
		return
	var existe = _checarAresta(numeroIdNPC,_NPC1Aresta)
	
	#tirar aresta
	if existe:
		_matrizPlayer[_NPC1Aresta][numeroIdNPC] = "0"
		_matrizPlayer[numeroIdNPC][_NPC1Aresta] = "0"
		#remover o efeito
		
		print("aresta removida entre os id:")
		print(_NPC1Aresta)
		print(numeroIdNPC)
		
	else:
		
		
	
		_matrizPlayer[_NPC1Aresta][numeroIdNPC] = "1"
		_matrizPlayer[numeroIdNPC][_NPC1Aresta] = "1"
		
		#add efeito
		print("aresta adiciona entre os id:")
		print(_NPC1Aresta)
		print(numeroIdNPC)
	#marca na matriz
	
		
	#reseta todos
	for filinhos in circularContainer.get_children():
		filinhos.voltarNormal()
	
	#reseta o primeiro numero aqui salvo
	_NPC1Aresta = null
	_printMatriz()
	
	
func _printMatriz():
	print("matriz player mudou")
	for linha in _matrizPlayer:
		var linha_str = ""
		for valor in linha:
			linha_str += str(valor) + " "
		print(linha_str.strip_edges())  

	
func resetClicado():
	_NPC1Aresta = null
	#print("fui resetado")

func _checarAresta(V1, V2)->bool:
	if _matrizPlayer[V1][V2] =="1":
		return true
	else:
		return false
	
