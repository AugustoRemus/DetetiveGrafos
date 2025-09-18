extends TextureButton

@export var texturaNPC: TextureRect

@export var silhueta = TextureRect

@export var silhuetaAmarela = TextureRect

@export var labelNome= Label

@export var npc = CharacterBody2D




var _id

var clicado = false


func setarTextura(sprite):
	
	texturaNPC.texture = sprite.Rsprite
	labelNome.text = sprite.RnomeCor



func _on_pressed() -> void:
	#print("voce clicou agorora no id:")
	#print(_id)
	
	if clicado:
		#foi clicado novamente
		clicado = false
		
		silhuetaAmarela.visible = false
		
		fuiClicado(false)
		
	else:
		#foi selecionado
		clicado = true
		
		silhuetaAmarela.visible = true
		
		fuiClicado(true)


func fuiClicado(condicao):
	if condicao:
		#passa o id e a posicao atua dele para desenhar a linha
		var posicaoCerta = global_position + (size / 2)
		get_parent().get_parent().get_parent().addAresta(_id, posicaoCerta)
		
	if !condicao:
		get_parent().get_parent().get_parent().resetClicado()
	
func voltarNormal():
		clicado = false
		#fuiClicado(false)
		silhuetaAmarela.visible = false
	
