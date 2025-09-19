extends Control

#controla as arestas
var arestas: Array[Aresta]


#adiciona uma nova aresta
func addAresta(_aresta: Aresta):

	
	var ponto_a = _aresta.posicao1
	var ponto_b = _aresta.posicao2
	
	#cria a linha
	var linha = Line2D.new()
	linha.width = 4.0 
	linha.default_color = Color.YELLOW
	
	linha.points = [ponto_a, ponto_b]
	

	add_child(linha)
	
	_aresta._setLinha(linha)
	arestas.append(_aresta)
	
	SomManager.escrever.play()
	#print("linha adicionada")
	

#remove a aresta se ela esta no aray apenas
func removeAresta(_aresta: Aresta):
	for aresta in arestas:
		if _aresta._comparar(aresta):
			aresta.linhaDesenho.queue_free()
			arestas.erase(aresta)
			SomManager.apagar.play()
			
	

#retorna true se existe ou false se n
func existeAresta(_aresta: Aresta):
	for aresta in arestas:
		if _aresta._comparar(aresta):
			#removeAresta(aresta)
			return true
	return false
