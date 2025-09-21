extends Node2D


@export var character : CharacterBody2D

@export var sprite: Sprite2D



func _ready() -> void:
	if character.hat:
		sprite.texture = character.hat.sprite
