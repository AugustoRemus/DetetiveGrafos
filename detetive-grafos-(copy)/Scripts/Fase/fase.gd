extends Node
class_name fase


var nome: String
var numero: int

var descricao: String

var tempo: int

var liberada: bool
var concluida: bool
var melhorPontuacao: int

var scena: PackedScene

var final : bool 

func _init(_nome: String, _numero: int, _descricao: String, _temp: int, _scena: PackedScene) -> void:
	
	nome = _nome
	numero = _numero
	descricao = _descricao
	tempo = _temp
	#na versao final botar false
	liberada = false
	melhorPontuacao = 0
	scena = _scena
	concluida = false
	final = false
