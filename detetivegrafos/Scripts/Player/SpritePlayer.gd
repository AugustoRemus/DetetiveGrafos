extends Sprite2D


#region animationVars
#contador do bob
var bob_time := 0.0
var bob_speed := GlobalPlayer.bobSpeedPlayer
var bob_height := 3.0

#endregion


#olhar caso esteja parado na parede parar a animação ao inves de
#quando tiver dire!


#adicionar move sprite para mover as mao?

func _animation(direcao, delta):
	#personagem esta se movendo
	#vai gerar uma onda e vai definindo a posição do sprite
	#basiada nesse calculo, muita doidera e matematica
	
	if direcao != Vector2.ZERO:
		bob_time += bob_speed 
		position.y = sin(bob_time) * bob_height
	else:
		#esta parado entao vai resetando aos poucos
		position.y = lerp(position.y, 0.0, 0.2)
