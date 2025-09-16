extends Node2D

@export var _transformar: Label
@export var _roubarCor: Label
@export var _conversar: Label

@export var _corAtual: Label
#caso jogador queira esconder
var _exibir := true
#para otimizar daria para nao chamar na outra parte

#mudar o grid 

func _ready() -> void:
	_corAtual.text = "Nenhuma"
	pass
	#botar aqui para setar o texto das tags se tiver outras linguas

func transformarLabel(condicao:bool):
	if !_exibir:
		return
		
	if condicao:
		_transformar.visible = true
	else:
		_transformar.visible = false

	
func roubarCorLabel(condicao:bool):
	if !_exibir:
		return
		
	if condicao:
		_roubarCor.visible = true
	else:
		_roubarCor.visible = false


func conversar(condicao:bool):
	if !_exibir:
		return
		
	if condicao:
		_conversar.visible = true
	else:
		_conversar.visible = false
