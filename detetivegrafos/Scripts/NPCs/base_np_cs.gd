extends CharacterBody2D
class_name NPCClasse


##Resource que define oque o npc vai ter de starts
@export var resourceNPC: NPCs

##define o id dele para montar o grafo e tals, definir na cena
var id: int

##lista com os destinos possiveis do npcs para andar
@export var nodosDestino: Array[Node2D]

@export_group("Atriburos resource")

##Vai ser definido pelo Resource
@export var speedNPC: float

##tempo min ate andar dnv, definido pelo resource
@export var tempoEsperaMin: float
##tempo max ate andar dnv, definido pelo resource
@export var tempoEsperaMax: float



@export_group("Nodos")
@export var animacaoNode: Node
@export var sprite: Sprite2D
@export var silhuetaNodo: Sprite2D
@export var LogicaInteraçoes: Node




#uma lista de npcs base que vai dizer quais ele gosta e quais n gosta
#bota aqui e é utilizado por outro nodo dele para a logica

func _ready() -> void:
	
	#essa parte seta o boneco base com os atributos do resource
	speedNPC = resourceNPC.Rspeed
	tempoEsperaMin = resourceNPC.RtempoEsperaMin
	tempoEsperaMax = resourceNPC.RtempoEsperaMax
	sprite.texture = resourceNPC.Rsprite
	
	pass

func _physics_process(delta: float) -> void:

	animacaoNode._animation(velocity)
	
	
func silhueta(numero):
	if numero == 1:
		silhuetaNodo.visible= true
	if numero == 0:
		silhuetaNodo.visible= false
		
		
func setID(novoId: int):
	id = novoId
