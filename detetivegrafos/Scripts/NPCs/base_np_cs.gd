extends CharacterBody2D
class_name NPCClasse


##Resource que define oque o npc vai ter de starts
@export var resourceNPC: NPCs

##define o id dele para montar o grafo e tals, definir na cena
var id: int

##se n for ter deixa null
@export var hat: hatsResource = null

##lista com os destinos possiveis do npcs para andar
@export var nodosDestino: Array[Node2D]

##se deixar false o gerado vai ser o que botou na lista
@export var randomDestinos: bool = true
@export var quantDestinos: int
@export var nodoComOsDestinos: Node


##amigos que terao intereçao caso o script seja o manual e n o 
##aleatorio, só tem q botar 1 dos 2
@export var ListaAmigosSimples: Array[CharacterBody2D]

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
	
	#pega os destinos
	if randomDestinos:
		for i in range(quantDestinos):
			var _nodoDestino = nodoComOsDestinos.get_child(randi()% 10)
			nodosDestino.append(_nodoDestino)
		
	pass

	
func silhueta(numero):
	if numero == 1:
		silhuetaNodo.visible= true
	if numero == 0:
		silhuetaNodo.visible= false
		
		
func setID(novoId: int):
	id = novoId
	#print("sou da cor:")
	#print(nomeCor)
	#print("e meu id é :")
	#print(id)
