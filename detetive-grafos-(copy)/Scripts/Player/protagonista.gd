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


func _process(delta):
	#z_index = int(position.y)
	#print(position)
	pass
#debug
