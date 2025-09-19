extends TextureButton

@export var texturaNPC: TextureRect

@export var silhueta = TextureRect

@export var silhuetaAmarela = TextureRect

@export var labelNome= Label

@export var npc = CharacterBody2D

var nomeCor

var _id

var clicado = false

var clicavel = true


signal fuiClicado(botao:Button)

func setarTextura(sprite):
	
	texturaNPC.texture = sprite.Rsprite
	labelNome.text = sprite.RnomeCor
	nomeCor = sprite.RnomeCor



func _on_pressed() -> void:
	if clicavel:
		fuiClicado.emit(self)

	
func desativar():
		clicado = false
		silhuetaAmarela.visible = false
	


func ativar():
	clicado = true
	silhuetaAmarela.visible = true



func _on_botao_secundario_pressed() -> void:
	_on_pressed()
