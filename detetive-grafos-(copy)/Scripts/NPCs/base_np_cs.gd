extends CharacterBody2D
class_name NPCClasse


##Resource que define oque o npc vai ter de starts
@export var resourceNPC: NPCs

##define o id dele para montar o grafo e tals, definir na cena
var id: int

##amigos que terao intereçao caso o script seja o manual e n o 
##aleatorio, só tem q botar 1 dos 2
@export var ListaAmigosSimples: Array[CharacterBody2D]



@export_enum("Aleatoria", "fila", "Estatico") var logicaMov: int = 0 

##lista com os destinos possiveis do npcs para andar se for fila
@export var nodosDestinoFila: Array[Node2D]

##se for random
@export var quantDestinos: int

##se for random
@export var nodoComOsDestinosRandom: Node



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
@export var labelNomeCor: Label
var nomeCor: String

@onready var navigation_agent_2d: NavigationAgent2D = $NavigationAgent2D


#uma lista de npcs base que vai dizer quais ele gosta e quais n gosta
#bota aqui e é utilizado por outro nodo dele para a logica

func _ready() -> void:
	
	#essa parte seta o boneco base com os atributos do resource
	speedNPC = resourceNPC.Rspeed
	tempoEsperaMin = resourceNPC.RtempoEsperaMin
	tempoEsperaMax = resourceNPC.RtempoEsperaMax
	nomeCor = resourceNPC.RnomeCor
	labelNomeCor.text = nomeCor
	sprite.texture = resourceNPC.Rsprite
	
	var listaDestinos
	
	#se for random
	if logicaMov == 0:
		listaDestinos = nodoComOsDestinosRandom.get_children()
		navigation_agent_2d.logica = $NavigationAgent2D/logicaRandom
		
	#se for fila
	elif logicaMov == 1:
		listaDestinos = nodosDestinoFila.duplicate()
		navigation_agent_2d.logica = $NavigationAgent2D/logicaFila
	
	elif logicaMov == 2:
		navigation_agent_2d.logica =$NavigationAgent2D/logicaStatica

	#todos tem essa func
	navigation_agent_2d.logica._setarPontos(quantDestinos,listaDestinos)

	
func silhueta(numero):
	if numero == 1:
		silhuetaNodo.visible= true
	if numero == 0:
		silhuetaNodo.visible= false
		
		
func setID(novoId: int):
	id = novoId
