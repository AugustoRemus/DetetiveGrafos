extends hat
class_name sorriso



func _equip():
	GlobalPlayer.scaleAreaInteracoes = Vector2(2,2)
	#ass

func _desEquip():
	GlobalPlayer.scaleAreaInteracoes = Vector2(1.0,1.0)
	#pass
