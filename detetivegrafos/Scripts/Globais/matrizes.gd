extends Node

var MatrizCerta

var MatrizPlayer

#chamar inicio da fase
func resetMatrizes():
	MatrizPlayer = null
	MatrizCerta = null

func calcularErro():
	var errosTotal = 0
	var tamanhoMatriz = MatrizCerta.size()
	for i in range(tamanhoMatriz):
		for j in range(tamanhoMatriz):
			if MatrizCerta[i][j] != MatrizPlayer[i][j]:
				errosTotal +=1 
				
	return errosTotal/2
	
	
func printMatriz(_matriz):
	print("matriz:")
	for linha in _matriz:
		var linha_str = ""
		for valor in linha:
			linha_str += str(valor) + " "
		print(linha_str.strip_edges())  


	
