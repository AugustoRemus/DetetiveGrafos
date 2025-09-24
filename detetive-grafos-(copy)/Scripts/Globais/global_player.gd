extends Node

##hats 
var hatAtual: hat

var moedas: int = 1


var hatsDesbloqueados: Array[hat] = []

var terceiroOlho:bool = false

var scaleAreaInteracoes:float = 1

var tempoAdicional:float = 0


var velocidadeMovimentoPlayer := 250.0
#se aumentar a velocidade diminuir isso para a animação 
#ficar mais rapida
var bobSpeedPlayer := 0.6

var zoomPlayer = Vector2(1,1)
