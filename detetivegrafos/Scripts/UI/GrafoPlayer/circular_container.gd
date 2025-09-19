extends Control


@export var raio: float = 75.0         
@export var angulo_inicial: float = 0.0

#var todosBotao

signal organizado(array)
#manda pro controlador d click
signal botaoClicado(botao)


func organizar_botoes():
	
	var centro = size / 2.0
	var botoes = get_children() 
	
	if botoes.size() == 0:
		return

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
	organizado.emit(botoes)
	conectarBotoes()
	
	
func conectarBotoes():
	var childs = get_children()
	for botao in childs:
		botao.fuiClicado.connect(botaoFoiClicado)

func botaoFoiClicado(_botao):
	botaoClicado.emit(_botao)
	#print("conectou")
