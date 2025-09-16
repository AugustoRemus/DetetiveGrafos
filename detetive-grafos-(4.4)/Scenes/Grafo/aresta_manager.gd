extends Control

#controla as arestas
var arestas: Array[Vector2]


func addAresta(_aresta: Aresta):

	arestas.append(Vector2(_aresta.Vertice1,_aresta.Vertice2))
	var ponto_a = _aresta.posicao1
	var ponto_b = _aresta.posicao2
	
	#cria a linha
	var linha = Line2D.new()
	linha.width = 4.0 
	linha.default_color = Color.YELLOW
	
	linha.points = [ponto_a, ponto_b]
	
	add_child(linha)
	print("linha adicionada")
	

func removeAresta(_aresta: Aresta):
	print("aresta repetida")
	var todasLinnhas = get_children()
	#pra todos os filhos
	for linha in todasLinnhas:
		#se forem linha
		if linha is Line2D:
			var pontos = linha.points
			#testa se forem iguais
			if (pontos[0] == _aresta.posicao1 and pontos[1] == _aresta.posicao2) \
			or  (pontos[1] == _aresta.posicao1 and pontos[0] == _aresta.posicao2):
				linha.queue_free()
	
