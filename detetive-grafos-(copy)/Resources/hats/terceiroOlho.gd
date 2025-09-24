extends hat
class_name terceiroOlho


func _equip():
	GlobalPlayer.terceiroOlho = true

func _desEquip():
	GlobalPlayer.terceiroOlho = false
