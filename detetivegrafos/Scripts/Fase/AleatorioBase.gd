extends LogicaGrafo
class_name AleatorioSimples

func CriarGrafo(NPCS: Array[NPCClasse]) -> Array:
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


	#preenche com coisa aleatoria, faz até a metade para ficar 
	#um lado igual do outro pois e uma grafo simples
	for i in range(n/2):
		for j in range(n):
			if i != j:
				#bota 0 ou 1 se forem diferente
				matriz_adjacencia[i][j] = randi() % 2
				matriz_adjacencia[j][i] = matriz_adjacencia[i][j]
			
	return matriz_adjacencia
