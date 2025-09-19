extends TextureButton

@export var texturaNPC: TextureRect

@export var silhuetaAmarela = TextureRect

@export var labelNome = Label

@export var npc = CharacterBody2D

var nomeCor

var id


var clicavel = true


signal fuiClicado(botao:TextureButton)


func setarTextura(_npc, _id):
	
	texturaNPC.texture = _npc.resourceNPC.Rsprite
	nomeCor = _npc.resourceNPC.RnomeCor
	labelNome.text =  str(nomeCor)
	id = _id
	#print(nomeCor)
	#print(id)



func _on_pressed() -> void:
	
	if clicavel:
		
		fuiClicado.emit(self)

	
	
func desativar():
		silhuetaAmarela.visible = false
	


func ativar():
	silhuetaAmarela.visible = true


func bloquear():
	silhuetaAmarela.visible = false
	clicavel = false
	

func desbloquear():
	clicavel = true
	



func _on_botao_secundario_pressed() -> void:
	_on_pressed()
