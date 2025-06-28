extends Node

@export var spriteNPC: Sprite2D

#pode variar se o npc for mais rapido, adicionar no resource
#no bob_speed
var bob_time := 0.0
var bob_speed := 0.4
var bob_height := 3.0



#passa a velocity do character do npc
func _animation(direcao):
	#vai ver se o npc esta se movendo
	if direcao != Vector2.ZERO:
		bob_time += bob_speed
		spriteNPC.position.y = sin(bob_time) * bob_height
	else:
		#esta parado entao vai resetando aos poucos
		spriteNPC.position.y = lerp(spriteNPC.position.y, 0.0, 0.2)
