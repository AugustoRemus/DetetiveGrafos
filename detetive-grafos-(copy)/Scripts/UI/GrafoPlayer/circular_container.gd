extends Control

##variaveis do container
@export var raio: float = 75.0         
@export var angulo_inicial: float = 0.0

var botaoAtual = null

@export var arestaManager: Control

func organizar_botoes():
	
	var centro = size / 2.0
	var botoes = get_children() 
	
	if botoes.size() == 0:
		return

	raio = raio + (botoes.size()*5)

	var quantidade = botoes.size()
	var angulo_por_botao = 360.0 / quantidade

	for i in range(quantidade):
		var angulo = angulo_inicial + i * angulo_por_botao
	
		var botao = botoes[i]
		var botao_centro = botao.size / 2.0
		
		var rad = deg_to_rad(angulo)
		var x = cos(rad) * raio 
		var y = sin(rad) * raio

		botoes[i].position = Vector2(x, y) + centro - botao_centro
	
	conectarBotoes()
	
	
func conectarBotoes():
	var childs = get_children()
	for botao in childs:
		botao.fuiClicado.connect(botaoFoiClicado)

func botaoFoiClicado(_botao):
	if botaoAtual == null:
		botaoAtual = _botao
		_botao.amarelar()
		
	elif botaoAtual == _botao:
		botaoAtual = null
		_botao.desamarelar()
		
	else:
		#pega o centro dos botões em coordenadas globais
		var posV1_global = botaoAtual.global_position + (botaoAtual.size / 2)
		var posV2_global = _botao.global_position + (_botao.size / 2)

		#converte as posições globais para locais do arestaManager
		var posV1_local = posV1_global - arestaManager.global_position
		var posV2_local = posV2_global - arestaManager.global_position

		var newAresta = Aresta.new(botaoAtual.id, posV1_local, _botao.id, posV2_local)
		arestaManager.tratarAresta(newAresta)
		
		_botao.desamarelar()
		botaoAtual.desamarelar()
		botaoAtual = null
		
