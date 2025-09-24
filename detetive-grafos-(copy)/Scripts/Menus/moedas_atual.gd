extends Panel

@onready var quant_moedas: Label = $quantMoedas


func _process(delta: float) -> void:
	quant_moedas.text = str(GlobalPlayer.moedas)
	
