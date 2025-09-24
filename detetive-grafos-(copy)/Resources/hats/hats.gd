extends Resource
class_name hat

#hat basico, os outros sobreescrevem a classe

@export var nome: String = "nome do hat"
@export var descricao: String =""
@export var sprite: Texture2D
@export var dica: String = ""

@export var desbloqueado: bool = false

@export var compravel: bool = true
@export var preco: int = 0

func _equip():
	pass

func _desEquip():
	pass
