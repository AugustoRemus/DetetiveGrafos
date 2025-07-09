extends Resource
class_name NPCs

#aqui criamos as variantes de npcs
#tem os campos no base_np_cs

##sprite do npc
@export var Rsprite: Texture2D

##nome cor
@export var RnomeCor: String

##Velociade que o npc anda
@export var Rspeed: float

##define a velocidade da animacao
@export var RbobSpeed: float

##tempo min ate andar dnv
@export var RtempoEsperaMin: float

##tempo max ate andar dnv
@export var RtempoEsperaMax: float
