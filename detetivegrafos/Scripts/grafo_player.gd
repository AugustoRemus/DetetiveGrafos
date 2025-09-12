extends CanvasLayer

@export var vertice: Node

@export var NPCs: Array[CharacterBody2D]


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("Espaco"): 
		if !visible:
			
			visible = true
		else:
			visible = false
