extends CharacterBody2D

#debug
@onready var camera_2d: Camera2D = $Camera2D
@export var area: Area2D
@export var transformador: Node
@export var interador: Node

@onready var move: Node = $Move

#id do npc transformado, vai ser um int
var idNPCTransformado = null


#se o personagem pode se transformar (n tem nada perto)
var possoTransformar: bool 
#se o personagem pode conversar
var possoConversar: bool
#se o personagem pode roubar a cor 
var possoRoubarCor: bool

var corDoMorto = false

signal TransformeiTutorial()
signal interagiCom(npc)

func _process(delta):
	#z_index = int(position.y)
	#print(position)
	pass
#debug


func _on_transformador_transformei() -> void:
	TransformeiTutorial.emit()


func _on_interador_interagi(npc) -> void:
	interagiCom.emit(npc)


func _on_transformador_virei_verde() -> void:
	corDoMorto = true
