extends Node

@onready var player: CharacterBody2D = $"../Player"

func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is corpoVerde:
		GlobalPlayer.hatsDesbloqueados.append(preload("uid://cdmh2bdqw5bk0"))
		get_tree().change_scene_to_packed(preload("uid://d4hdbf5d1gjfk"))
		
	
