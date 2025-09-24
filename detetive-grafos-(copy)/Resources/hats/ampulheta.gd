extends hat
class_name ampulheta


func _equip():
	
	GlobalPlayer.tempoAdicional = 15
	#print("tempo adicionado")
	

func _desEquip():
	GlobalPlayer.tempoAdicional = 0
	#print("tempo perdido")
	
