extends TextureButton

@export var texturaNPC: TextureRect

@export var silhueta = TextureRect

@export var silhuetaAmarela = TextureRect

@export var labelNome= Label

@export var npc = CharacterBody2D


var _id

var clicado = false

var clicavel = true


signal fuiClicado(botao:Button)

func setarTextura(sprite):
	
	texturaNPC.texture = sprite.Rsprite
	labelNome.text = sprite.RnomeCor



func _on_pressed() -> void:
	# se n estiver clicavel ignora
	if !clicavel:
		return
	#print("voce clicou agorora no id:")
	#print(_id)
	
	if clicado:
		#foi clicado novamente
		clicado = false
		
		silhuetaAmarela.visible = false
		
		get_parent().get_parent().get_parent().resetClicado()
		
	else:
		#foi selecionado
		clicado = true
		
		silhuetaAmarela.visible = true
		
		var posicaoCerta = global_position + (size / 2)
		get_parent().get_parent().get_parent().addAresta(_id, posicaoCerta)
		

	
func voltarNormal():
		clicado = false
		
		silhuetaAmarela.visible = false
	


func _on_botao_secundario_pressed() -> void:
	_on_pressed()
