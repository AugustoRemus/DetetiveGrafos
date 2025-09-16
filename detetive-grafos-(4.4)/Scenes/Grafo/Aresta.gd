class_name Aresta

var id: int

var Vertice1: int
var Vertice2: int

var posicao1: Vector2  
var posicao2: Vector2  

func _init(_p1: Vector2, _p2: Vector2, _v1: int, _v2: int) -> void:
	posicao1 = _p1
	posicao2 = _p2
	Vertice1 = _v1
	Vertice2 = _v2

func _setId(_id: int):
	id = _id
