extends hat
class_name hatSpeed


func _equip():
	GlobalPlayer.velocidadeMovimentoPlayer = 350
	GlobalPlayer.bobSpeedPlayer = 0.9
	pass

func _desEquip():
	#valor base
	GlobalPlayer.velocidadeMovimentoPlayer = 250
	GlobalPlayer.bobSpeedPlayer = 0.6
	pass
