extends hat
class_name hatSpeed


func _equip():
	GlobalPlayer.velocidadeMovimentoPlayer = 300
	GlobalPlayer.bobSpeedPlayer = 0.8
	pass

func _desEquip():
	#valor base
	GlobalPlayer.velocidadeMovimentoPlayer = 250
	GlobalPlayer.bobSpeedPlayer = 0.6
	pass
