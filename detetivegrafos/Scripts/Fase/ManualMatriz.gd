extends LogicaGrafo
class_name CriarManual

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
		
	for npc in NPCS:
		for amigo in npc.ListaAmigosSimples:
			matriz_adjacencia[npc.id][amigo.id] = "1"
			matriz_adjacencia[amigo.id][npc.id] = "1"

	
	return matriz_adjacencia
