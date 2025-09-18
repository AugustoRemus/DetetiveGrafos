extends Control
class_name CircularContainer

var radius: float = 100
var start_angle: float = 0.0 

@export var grafo_player: CanvasLayer
@export var vertice_scene: PackedScene = preload("res://Scenes/Grafo/vertice.tscn")
func _ready() -> void:
	organizar_em_circulo()
	
func organizar_em_circulo():
	var num_children = get_children().size()
	
	#calcula angulo igual
	var angle_step = 360.0 / num_children 
	
	#se tiver mt aumenta o tamanho
	if num_children > 5:
		var demais = num_children - 5
		radius  = radius + demais * 15
	#
	for i in range(num_children):
		var child = get_child(i)
		if child is Control:
			var angle_deg = start_angle + i * angle_step
			var angle_rad = deg_to_rad(angle_deg)
			
			#da o id para controlar a matriz
			child._id = i
			
			#Calcula posição usando seno e cosseno
			var x = radius * cos(angle_rad)
			var y = radius * sin(angle_rad)


			#Define posição centralizada
			child.position = Vector2(
				size.x / 2 + x - child.size.x / 2,
				size.y / 2 + y - child.size.y / 2
			)
