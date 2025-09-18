extends Node2D

#configurações futuras, maior ui!

@export var canvasTeclas: CanvasLayer
@export var canvasCorTransformada: CanvasLayer
@export var labelNomeCor: Label
@export var texturaSprite: TextureRect

@export var labelConversar: Label

func attLegenda(condicao):
	canvasTeclas.visible = condicao


func attTransformacao(NPC: CharacterBody2D):
	#se der pra resetar
	if NPC == null:
		labelNomeCor.text = ""
		texturaSprite.texture = null
		canvasCorTransformada.visible = false
		
	canvasCorTransformada.visible = true
	labelNomeCor.text = NPC.nomeCor
	texturaSprite.texture = NPC.sprite.texture
	#para n aparecer que da pra conversar no inicio
	labelConversar.visible = true
	
