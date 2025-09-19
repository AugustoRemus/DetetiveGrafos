extends Node2D

var volume = 75

@onready var musica: AudioStreamPlayer2D = $Musica



@onready var click: AudioStreamPlayer2D = $click

@onready var escrever: AudioStreamPlayer2D = $escrever

@onready var apagar: AudioStreamPlayer2D = $apagar

@onready var hover: AudioStreamPlayer2D = $hover

@onready var interacao_positiva: AudioStreamPlayer2D = $InteracaoPositiva

@onready var interacao_negativa: AudioStreamPlayer2D = $interacaoNegativa

@onready var abrindo_grafo: AudioStreamPlayer = $AbrindoGrafo

@onready var fechando_grafo: AudioStreamPlayer = $FechandoGrafo

@onready var erro: AudioStreamPlayer2D = $Erro

@onready var erro_2: AudioStreamPlayer = $Erro2

@onready var transformacao: AudioStreamPlayer = $Transformacao

@onready var botao_dif_hard: AudioStreamPlayer = $BotaoDifHard
@onready var botao_dif_izi: AudioStreamPlayer = $BotaoDifIzi
@onready var botao_dif_medio: AudioStreamPlayer = $Dif1



@onready var todos_sons := [musica, erro, click, escrever, apagar,hover,
interacao_negativa, interacao_positiva,abrindo_grafo,fechando_grafo, erro_2,
transformacao,botao_dif_hard,botao_dif_izi,botao_dif_medio]

@onready var sonsErro = [erro_2,erro]

func _ready():
	atualizar_volume(volume)

func erroTocar():
	sonsErro.pick_random().play()
	

func atualizar_volume(_newVolume):
	volume = int(_newVolume)
	var db = linear_to_db(volume / 100.0)
	for som in todos_sons:
		if som:
			som.volume_db = db
	
