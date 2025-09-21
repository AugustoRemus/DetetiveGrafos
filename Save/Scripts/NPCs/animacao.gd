extends Node

#character base
@onready var base_np_cs: CharacterBody2D = $".."

#node do sprite
@export var spriteNPC: Sprite2D

#pode variar se o npc for mais rapido, adicionar no resource
#no bob_speed
var bob_time := 0.0
var bob_speed := 0.4
var bob_height := 3.0


func _ready() -> void:
	bob_speed = base_np_cs.resourceNPC.RbobSpeed

func _physics_process(delta: float) -> void:
	var _ignoaraWarning = delta
	_ignoaraWarning = 1
	
	#vai ver se o npc esta se movendo
	if base_np_cs.velocity != Vector2.ZERO:
		bob_time += bob_speed
		spriteNPC.position.y = sin(bob_time) * bob_height
	else:
		#esta parado entao vai resetando aos poucos
		spriteNPC.position.y = lerp(spriteNPC.position.y, 0.0, 0.2)
	
