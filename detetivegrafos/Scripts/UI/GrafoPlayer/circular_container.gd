extends Control
class_name CircularContainer

var radius: float = 100
var start_angle: float = 0.0 

var botaoAtivo: TextureButton = null

var todosBotoes: Array

@export var grafo_player: CanvasLayer

@export var vertice : PackedScene = preload("res://Scenes/Grafo/vertice.tscn")

@export var arestaManager: Control

func trancarTodos():
	for botao in todosBotoes:
		botao.clicavel = false


func liberarTodos():
	for botao in todosBotoes:
			botao.clicavel = true



func resetarTodos():
	botaoAtivo = null
	for botao in todosBotoes:
		botao.desativar()
	



func fuiApertado(botaoApertado):
	#print("cheguei aqui")
	if botaoAtivo == null:
		#print("novo selecionado")
		
		botaoAtivo = botaoApertado
		botaoApertado.ativar()
		
	elif botaoAtivo == botaoApertado:
		
		#print("descelecionado")
		botaoAtivo = null
		botaoApertado.desativar()
		
		
	elif botaoApertado != botaoAtivo:
		
		#print("teste de aresta entre")
		#print(botaoApertado.position)
		#print(botaoAtivo.position)
		
		#ta errado ainda
		var posP1 = botaoApertado.global_position
		var posP2 = botaoAtivo.global_position
		
		var aresta = Aresta.new(botaoApertado._id, posP1, botaoAtivo._id, posP2)
		arestaManager.lidarAresta(aresta)
		
		botaoApertado.desativar()
		botaoAtivo.desativar()
		botaoAtivo = null
	
	

func adicionarFilhos(NPCS):
	#print("array q chegou")
	#print(NPCs)
	var contador = 0
	for npc in NPCS:
		
		var botao = vertice.instantiate()
		botao.setarTextura(NPCS[contador].resourceNPC)
		
		botao._id = contador
		contador+= 1
		
		add_child(botao) 
		todosBotoes.append(botao)
	
	organizar_em_circulo()
	#print("array final")
	#print(todosBotoes)

func organizar_em_circulo():
	var num_children = todosBotoes.size()
	
	#calcula angulo igual
	var angle_step = 360.0 / num_children 
	
	#se tiver mt aumenta o tamanho
	if num_children > 5:
		var demais = num_children - 5
		radius  = radius + demais * 15
	#
	for i in range(num_children):
		var child = todosBotoes[i]
		#print(child.name)
		if child is TextureButton:
			#todosBotoes.append(child)
			var angle_deg = start_angle + i * angle_step
			var angle_rad = deg_to_rad(angle_deg)
			
			#da o id para controlar a matriz
			child._id = i
			
			#Calcula posição usando seno e cosseno
			var x = radius * cos(angle_rad)
			var y = radius * sin(angle_rad)


			#Define posição centralizada
			child.position = Vector2(
				size.x / 2 + x - child.size.x / 2,
				size.y / 2 + y - child.size.y / 2
			)
			
	for botao in todosBotoes:
		botao.fuiClicado.connect(fuiApertado)
