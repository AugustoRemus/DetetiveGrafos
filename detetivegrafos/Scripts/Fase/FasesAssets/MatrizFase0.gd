extends LogicaGrafo


#vao ser 4 npcs
func CriarGrafo(NPCS: Array[NPCClasse]) -> Array:
	var n = NPCS.size()
	var matriz_adjacencia = []

	for i in range(n):
		var linha = []
		for j in range(n):
			if i == j:
				linha.append("x")
			else:
				linha.append("0")
		matriz_adjacencia.append(linha)
		
	#adicionando os vertices
	matriz_adjacencia[0][1] = "1"
	matriz_adjacencia[1][0] = "1"
	
	matriz_adjacencia[1][2] = "1"
	matriz_adjacencia[2][1] = "1"
	
	matriz_adjacencia[2][0] = "1"
	matriz_adjacencia[0][2] = "1"

	
	return matriz_adjacencia
