extends TextureButton

@export var npc = CharacterBody2D


func _ready() -> void:
	texture_normal = npc.sprite.texture
	
