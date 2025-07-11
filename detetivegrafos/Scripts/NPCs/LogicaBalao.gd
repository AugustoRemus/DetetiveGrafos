extends Sprite2D

@export var baloes: Array[Texture2D]

@export var timer: Timer


#curva q vai definir a visibilidade, implementar dps
@export var _visibitiCurve: Curve

#tempo da animacao
@export var _duracao: float 


func exibirBalao(balao:int):
	#starta o timer
	timer.start()
	#define a textura
	texture = baloes[balao]
	#mostra
	visible = true

	
func _on_timer_balao_timeout() -> void:
	visible = false
	#_sumindo = true
	
