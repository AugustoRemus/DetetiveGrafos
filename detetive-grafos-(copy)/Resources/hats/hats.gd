extends Resource
class_name hat

#hat basico, os outros sobreescrevem a classe

@export var nome: String = "nome do hat"
@export var sprite: Texture2D

@export var desbloqueado: bool = false
@export var preco: int = 0

func _equip():
	pass

func _desEquip():
	pass
