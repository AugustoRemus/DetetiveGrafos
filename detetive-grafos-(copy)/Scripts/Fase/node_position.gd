extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D

@export var id: int

func _ready() -> void:
	sprite_2d.texture = null
