extends Node

@export var player = CharacterBody2D

@export var area = Area2D

signal interagi(npc)

#zoom esta bugando as texturas
func _input(event: InputEvent) -> void:
	#so tranforma se n tem ninguem pra conversar
	if Input.is_action_just_pressed("E"):
		#se tiver algo no id 
		if (player.idNPCTransformado!= null and area.corpoAtual != null ):
			gerarInteracao(area.corpoAtual, player.idNPCTransformado)
			interagi.emit(area.corpoAtual)
		else:		
			SomManager.erro.play()

	var _tiraWarning = event
	_tiraWarning = "sai"
		

func gerarInteracao(npc: NPCClasse, id:int):
	
	#cena especialFinal
	if npc.nomeCor == "Laranja" and player.corDoMorto:
		print("cena secreta")
	
	npc.LogicaInteraçoes.interacaoID(id)
	
	pass
