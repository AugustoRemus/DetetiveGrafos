extends Panel

@onready var quant_moedas: Label = $quantMoedas


func _ready() -> void:
	quant_moedas.text = str(GlobalPlayer.moedas)
