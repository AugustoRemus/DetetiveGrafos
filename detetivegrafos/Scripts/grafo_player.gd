extends CanvasLayer

@export var vertice : PackedScene = preload("res://Scenes/Grafo/vertice.tscn")

@export var nodoDosNPC: Node
var NPCS: Array[Node]

var _matrizPlayer

@export var arestaManager: Node


@export var circularContainer: Control

var aparente = false
var posEscondido = Vector2(75.5,200)
var posMostrando = Vector2(75.5,25.5)
#guarda o numero
var _NPC1Aresta = null
#guarda a posicao
var _NPC1Pos = null



func _ready() -> void:
	pegaOsNPCs()
	startGrafo()
	_Teste_CriarFIlhos()
	circularContainer.organizar_em_circulo()


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Espaco"): 
		if !aparente:
			
			visible = true
			aparente = true
			#position = lerp(posEscondido,posMostrando,1)
		else:
			aparente = false
			visible = false
			

func pegaOsNPCs():
	NPCS = nodoDosNPC.get_children()


#cria a matriz do player, toda zerada
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


#bota os filhos no container circular
func _Teste_CriarFIlhos():
	var contador = 0
	for filho in NPCS:
		var botao = vertice.instantiate()
		
		botao.setarTextura(NPCS[contador].resourceNPC)
		contador+= 1
		circularContainer.add_child(botao) 
	


func addAresta(numeroIdNPC, posicaoNPC):
	#se só tem 1 clicado
	if _NPC1Aresta == null:
		_NPC1Aresta = numeroIdNPC
		_NPC1Pos = posicaoNPC
		
		return
		
	var existe = _existeAresta(numeroIdNPC,_NPC1Aresta)
	
	var newAresta = Aresta.new(_NPC1Pos,posicaoNPC,_NPC1Aresta,numeroIdNPC)
	
	#tirar aresta
	if existe:
		_matrizPlayer[_NPC1Aresta][numeroIdNPC] = "0"
		_matrizPlayer[numeroIdNPC][_NPC1Aresta] = "0"
		
		#parte visual
		arestaManager.removeAresta(newAresta)
		
		#print("aresta removida entre os id:")
		#print(_NPC1Aresta)
		#print(numeroIdNPC)
		
	else:
		#aresta n existe ainda entao adiciona
		_matrizPlayer[_NPC1Aresta][numeroIdNPC] = "1"
		_matrizPlayer[numeroIdNPC][_NPC1Aresta] = "1"
		
		#parte visual
		arestaManager.addAresta(newAresta)
		
		#print("aresta adiciona entre os id:")
		#print(newAresta.Vertice1)
		#print(newAresta.Vertice2)

	#reseta todos
	for filinhos in circularContainer.get_children():
		filinhos.voltarNormal()
	
	#reseta o primeiro numero aqui salvo
	_NPC1Aresta = null
	_NPC1Pos = null
	#_printMatriz()
	
	
func _printMatriz():
	print("matriz player mudou")
	for linha in _matrizPlayer:
		var linha_str = ""
		for valor in linha:
			linha_str += str(valor) + " "
		print(linha_str.strip_edges())  


#usado no vertice, nao apagar!
func resetClicado():
	_NPC1Aresta = null
	_NPC1Pos = null
	#print("fui resetado")



func _existeAresta(V1, V2)->bool:
	if _matrizPlayer[V1][V2] =="1" or _matrizPlayer[V2][V1] =="1":
		return true
	else:
		return false
	

func entregar():
	get_parent().finalizou(_matrizPlayer)


#quando clicar q terminou ou acabou o tempo
func _on_entregar_pressed() -> void:
	entregar()
