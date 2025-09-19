extends CanvasLayer

var aparecendo = false

@export var nodeComOsNPCs: Node

@export var nodoCircularContainer: Control
var arrayNPCs: Array[Node]

var vertice: PackedScene = preload("uid://d32giarwu8rbf")

func _ready() -> void:
	
	arrayNPCs = nodeComOsNPCs.get_children().duplicate()
	#print(arrayNPCs)
	
	var contador = 0
	for npc in arrayNPCs:
		
		var newVertice = vertice.instantiate()
		newVertice.setarTextura(npc, contador)
		contador += 1
		nodoCircularContainer.add_child(newVertice)
		
	nodoCircularContainer.organizar_botoes()
	

func _input(event: InputEvent) -> void:
	#mudar dps se pa
	if Input.is_action_just_pressed("Espaco"):
		visible = !visible
		aparecendo = !aparecendo


func entregar():
	pass
