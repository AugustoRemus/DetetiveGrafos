extends Sprite2D


#region animationVars
#contador do bob
var bob_time := 0.0
var bob_speed := GlobalPlayer.bobSpeedPlayer
var bob_height := 3.0
var base_offset
#endregion


func _ready():
	
	base_offset = offset

func _animation(direcao):
	#personagem esta se movendo
	#vai gerar uma onda e vai definindo a posição do sprite
	#basiada nesse calculo, muita doidera e matematica
	
	if direcao != Vector2.ZERO:
		bob_time += bob_speed 
		offset.y = base_offset.y + sin(bob_time) * bob_height
	else:
		
		offset.y = lerp(offset.y, base_offset.y, 0.2)
