class_name Aresta

var id: int

var Vertice1: int
var Vertice2: int

var posicao1: Vector2  
var posicao2: Vector2  

var linhaDesenho: Line2D

func _init( _v1: int,_p1: Vector2,_v2: int, _p2: Vector2) -> void:
	posicao1 = _p1
	posicao2 = _p2
	Vertice1 = _v1
	Vertice2 = _v2

func _setId(_id: int):
	id = _id

func _setLinha(_linha: Line2D):
	linhaDesenho = _linha
	
func _comparar(_aresta: Aresta):
	if Vertice1 == _aresta.Vertice1 and Vertice2 == _aresta.Vertice2:
		return true
	if  Vertice1 == _aresta.Vertice2 and Vertice2 == _aresta.Vertice1:
		return true
	return false
