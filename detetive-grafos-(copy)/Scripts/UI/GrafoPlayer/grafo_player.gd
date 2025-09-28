extends CanvasLayer

var nodoFase: Node2D

var aparecendo = false

@onready var tudo: Panel = $Panel


@onready var color_rect: ColorRect = $ColorRect


@export var nodoCircularContainer: Control

var _matrizPlayer

signal mudeiValorTutorial()

@onready var aviso: AnimatedSprite2D = $aviso

var vertice: PackedScene = preload("uid://d32giarwu8rbf")

func _ready() -> void:
	#visible = false
	nodoFase = get_parent()
	var arrayNPCs: Array[Node]
	
	#arrayNPCs = nodeComOsNPCs.get_children().duplicate()
	
	#duplicate?
	arrayNPCs= get_tree().get_nodes_in_group("NPCs")
	
	
	var contador = 0
	for npc in arrayNPCs:
		
		var newVertice = vertice.instantiate()
		newVertice.setarTextura(npc, contador)
		contador += 1
		nodoCircularContainer.add_child(newVertice)
		
	nodoCircularContainer.organizar_botoes()
	
	_startMatrizPlayer(arrayNPCs.size())



func ligarNot():
	aviso.aparecer()
	
	
func _input(event: InputEvent) -> void:
	#mudar dps se pa
	if Input.is_action_just_pressed("Espaco") or Input.is_action_just_pressed("esq"):
		 
		#visible = true
		
		if tudo.visible:
			SomManager.fechando_grafo.play()
		else:
			SomManager.abrindo_grafo.play()
			
		color_rect.deslizar()
		tudo.visible = !tudo.visible
		aparecendo = !aparecendo


func _startMatrizPlayer(n:int):

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
	



func entregar():
	Matrizes.MatrizPlayer = _matrizPlayer
	Matrizes.MatrizCerta = nodoFase.matrizNPCs
	get_tree().change_scene_to_file("res://Scenes/Menus/resultados.tscn")





func _on_aresta_manager_mudar_matriz_player(v1: Variant, v2: Variant, novoValor: Variant) -> void:
	_matrizPlayer[v1][v2] = novoValor
	mudeiValorTutorial.emit()
	#Matrizes.printMatriz(_matrizPlayer)



func _on_sim_entrega_pressed() -> void:
	entregar()


func _on_sair_pressed() -> void:
	SomManager.fechando_grafo.play()
	color_rect.deslizar()
	tudo.visible = !tudo.visible
	aparecendo = !aparecendo
