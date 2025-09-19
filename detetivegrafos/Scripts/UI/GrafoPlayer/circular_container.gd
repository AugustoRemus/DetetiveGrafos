extends Control


@export var raio: float = 150.0         
@export var angulo_inicial: float = 0.0 


func organizar_botoes():
	
	var botoes = get_children() 
	
	if botoes.size() == 0:
		return

	var quantidade = botoes.size()
	var angulo_por_botao = 360.0 / quantidade

	for i in range(quantidade):
		var angulo = angulo_inicial + i * angulo_por_botao
	

		var rad = deg_to_rad(angulo)
		var x = cos(rad) * raio
		var y = sin(rad) * raio

		botoes[i].position = Vector2(x, y)
