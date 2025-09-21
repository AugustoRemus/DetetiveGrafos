extends Sprite2D

@export var timer: Timer

@onready var audio_stream_player_2d: AudioStreamPlayer2D = $AudioStreamPlayer2D

#curva q vai definir a visibilidade, implementar dps
@export var _visibitiCurve: Curve

#tempo da animacao
@export var _duracao: float 


func exibirBalao(_interacao: interacao):
	#starta o timer
	timer.start()
	#define a textura
	texture = _interacao.sprite
	audio_stream_player_2d.stream = _interacao.audioDaInteracao
	audio_stream_player_2d.play()
	
	#ajusta o volume
	var db = linear_to_db(SomManager.volume / 100.0)
	audio_stream_player_2d.volume_db = db
	
	#mostra
	visible = true

	
func _on_timer_balao_timeout() -> void:
	visible = false
	#_sumindo = true
	
