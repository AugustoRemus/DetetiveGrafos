extends hat
class_name ampulheta


func _equip():
	
	GlobalPlayer.tempoAdicional = 15
	pass

func _desEquip():
	GlobalPlayer.tempoAdicional = 0
	pass
