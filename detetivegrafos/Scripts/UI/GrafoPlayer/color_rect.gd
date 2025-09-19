extends ColorRect

@export var posicao_inicial: Vector2 = Vector2(0, 0)

@export var posicao_final: Vector2 = Vector2(400, 0)
@export var duracao: float = 0.2

var no_final: bool = true  
func _ready():
	position = posicao_final

func deslizar():
	#visible = true
	var destino: Vector2
	if no_final:
		destino = posicao_inicial
		no_final = false
	else:
		destino = posicao_final
		no_final = true

	#cria um tween temporário que já se destrói sozinho
	create_tween().tween_property(self, "position", destino, duracao).set_trans(Tween.TRANS_LINEAR).set_ease(Tween.EASE_IN_OUT)
