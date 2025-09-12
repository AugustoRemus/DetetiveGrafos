extends CanvasLayer

@export var vertice : PackedScene = preload("res://Scenes/Grafo/vertice.tscn")

@export var nodoDosNPC: Node
var NPCS: Array[Node]

var _matrizPlayer


@export var circularContainer: Control

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
				linha.append(0)
		#adiciona a linha
		matriz_adjacencia.append(linha)
	_matrizPlayer = matriz_adjacencia

func _Teste_CriarFIlhos():
	var contador = 0
	for filho in NPCS:
		var botao = vertice.instantiate()
		botao.texture_normal = NPCS[contador].resourceNPC.Rsprite
		contador+= 1
		circularContainer.add_child(botao) 
	
