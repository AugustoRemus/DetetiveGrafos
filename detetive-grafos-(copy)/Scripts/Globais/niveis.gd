extends Node

var faseAtual: fase = null

var fases: Array[fase]

#contando tutorial
var quantNiveis = 6

#0 facil, 1 médio, 2 dificil
var dificuldade = 1



func _ready() -> void:
	var _fase = fase.new("tutorial", 0, "aprendendo", 300, preload("uid://7o1tn60hux7k"))
	_fase.liberada = true
	
	fases.append(_fase)
	
	_fase = fase.new("fase 1", 1, "fasenda1", 120,preload("uid://svxd78rnba0f"))
	_fase.liberada = false
	fases.append(_fase)
	
	_fase = fase.new("fase 2", 2, "fasenda2", 120,preload("uid://dqeil05tuy0vk") )
	fases.append(_fase)
	
	_fase = fase.new("fase 3", 3, "fasenda3", 120,preload("uid://dm0uskdyv2ndy"))
	fases.append(_fase)
	
	
	_fase = fase.new("fase 4", 4, "fasenda4", 120, preload("uid://bvvvnj8tnoaol"))
	fases.append(_fase)
	
	
	_fase = fase.new("fase 5", 5, "fasenda5", 120, preload("uid://dkjj5eo8dulo3"))
	fases.append(_fase)
	
