extends Node

@export var area : Area2D

func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("Q"):
		print(area.getAtual().id)
		
		
