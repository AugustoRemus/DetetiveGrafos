extends Node2D

var volume = 75

@onready var musica: AudioStreamPlayer2D = $Musica

@onready var erro: AudioStreamPlayer2D = $Erro

@onready var click: AudioStreamPlayer2D = $click

@onready var escrever: AudioStreamPlayer2D = $escrever

@onready var apagar: AudioStreamPlayer2D = $apagar


@onready var todos_sons := [musica, erro, click, escrever, apagar]

func _ready():
	atualizar_volume(volume)


func atualizar_volume(_newVolume):
	volume = int(_newVolume)
	var db = linear_to_db(volume / 100.0)
	for som in todos_sons:
		if som:
			som.volume_db = db
	
