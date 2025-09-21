extends Node

@export var player = CharacterBody2D

@export var area = Area2D

#zoom esta bugando as texturas
func _input(event: InputEvent) -> void:
	#so tranforma se n tem ninguem pra conversar
	if Input.is_action_just_pressed("E"):
		#se tiver algo no id 
		if (player.idNPCTransformado!= null and area.corpoAtual != null ):
			gerarInteracao(area.corpoAtual, player.idNPCTransformado)
			
		else:		
			SomManager.erro.play()

	var _tiraWarning = event
	_tiraWarning = "sai"
		

func gerarInteracao(npc: NPCClasse, id:int):
	npc.LogicaInteraçoes.interacaoID(id)
	
	pass
