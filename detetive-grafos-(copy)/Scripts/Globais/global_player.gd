extends Node
#debug
const TERCEIRO_OLHO = preload("uid://cdmh2bdqw5bk0")

#debyg
var hatAtual: hat #= TERCEIRO_OLHO

var moedas: int = 2

#para debug botar outros
#var hatsDesbloqueados: Array[hat] = []

#debyg?
const HAT_INUTIL = preload("uid://xle4fefbmcyf")

var hatsDesbloqueados: Array[hat] = [HAT_INUTIL]

var terceiroOlho = false


var velocidadeMovimentoPlayer := 250.0
#se aumentar a velocidade diminuir isso para a animação 
#ficar mais rapida
var bobSpeedPlayer := 0.6

var zoomPlayer = Vector2(1,1)
