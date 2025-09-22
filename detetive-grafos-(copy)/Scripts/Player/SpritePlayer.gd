extends Sprite2D

@onready var sombra: Sprite2D = $sombra

#region animationVars
#contador do bob
var bob_time := 0.0
var bob_speed := GlobalPlayer.bobSpeedPlayer
var bob_height := 3.0

var base_offset

var base_sombra_scale: Vector2
var base_sombra_offset: Vector2

#endregion


func _ready():
	
	base_offset = offset
	base_sombra_scale = sombra.scale
	base_sombra_offset = sombra.offset

func _animation(direcao):
	#personagem esta se movendo
	#vai gerar uma onda e vai definindo a posição do sprite
	#basiada nesse calculo, muita doidera e matematica
	if direcao != Vector2.ZERO:
		bob_time += bob_speed
		
		
		var bob = sin(bob_time) * bob_height
		offset.y = base_offset.y + bob
		
		#ajustando a sombra
		var scale_factor = 1.0 - (bob / (bob_height * 2.0))
		sombra.scale = base_sombra_scale * clamp(scale_factor, 0.95, 1.05)
	else:
		#volta
		offset.y = lerp(offset.y, base_offset.y, 0.2)
		sombra.scale = sombra.scale.lerp(base_sombra_scale, 0.2)
