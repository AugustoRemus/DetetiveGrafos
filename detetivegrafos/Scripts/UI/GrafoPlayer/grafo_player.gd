extends CanvasLayer

#bug: n ta mais deletando a lnha dps q volta
#a aparecencia



@export var nodoDosNPC: Node

var NPCS: Array[Node]

var _matrizPlayer

@export var arestaManager: Node


@export var circularContainer: Control

var aparente = false
var posEscondido = Vector2(75.5,400)
var posMostrando = Vector2(75.5,25.5)



@onready var panel: Panel = $Panel


func _ready() -> void:
	visible = true
	panel.position = posEscondido
	pegaOsNPCs()
	startGrafo()
	circularContainer.adicionarFilhos(NPCS)
	circularContainer.organizar_em_circulo()
	#panel.position = posEscondido



func _physics_process(delta: float) -> void:
	if panel.position == Vector2(75.5, 25.5):
		circularContainer.liberarTodos()
		
	else:
	
		circularContainer.trancarTodos()
		
		
	var _warningKiller = delta
	_warningKiller = 3



func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Espaco") or event.is_action_pressed("esq") : 
		circularContainer.resetarTodos()
		if !aparente:
			
			mostrar_animado()
			
		else:	
			esconder_animado()
			
			

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


func addArestaMatriz(v1: int, v2: int, conteudo : String):
	_matrizPlayer[v1][v2] = conteudo
	_matrizPlayer[v2][v1] = conteudo
		
func _printMatriz():
	print("matriz player mudou")
	for linha in _matrizPlayer:
		var linha_str = ""
		for valor in linha:
			linha_str += str(valor) + " "
		print(linha_str.strip_edges())  





func entregar():
	# paia trocar por sinal
	get_parent().finalizou(_matrizPlayer)


#quando clicar q terminou ou acabou o tempo




func mostrar_animado():
	#marca q ta mostrando
	aparente = true
	
	#cria curva
	var tween = create_tween()
	tween.tween_property(self.panel, "position", posMostrando, 0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_OUT)
	

func esconder_animado():
	#marca escondido
	aparente = false
	
	#volta
	var tween = create_tween()
	tween.tween_property(self.panel, "position", posEscondido, 0.5).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)

#entrega o grafo
func _on_sim_entrega_pressed() -> void:
	entregar()
