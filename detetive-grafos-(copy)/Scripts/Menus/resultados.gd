extends Control
@onready var debug: Label = $Label

@export var voltarBotao: Button


@export var quantErros: Label
@export var tempoRestante: Label
@export var resultado: Label

@export var estrelasTextura: TextureRect
@export var arrayTexturas: Array[Texture2D]


@export var botaoProxFase: Button

var _totalErros

signal resultadoSignal(ganhou: bool)

func _ready() -> void:
	_totalErros = Matrizes.calcularErro()
	
	quantErros.text = str(_totalErros)
	
	
	tempoRestante.text = Matrizes.TempoFinalFase
	
	var _nivelAtual = Niveis.faseAtual.numero
	
	#falhou
	if _totalErros >= 3:
		resultado.text = "FALHADA!"
		
		resultadoSignal.emit(false)
		
		estrelasTextura.texture = arrayTexturas[0]
		
		#se perdeu no 0
		if Niveis.fases[0] == Niveis.faseAtual:
			GlobalPlayer.hatsDesbloqueados.append(preload("uid://cdmh2bdqw5bk0"))
			resultado.text = "FALHADA!?!?"
		return
		#botar label e tals
	else:
		resultado.text = "CONCLUIDA!"
		#ativa botao next fase
		resultadoSignal.emit(true)
		#seta o nivel e libera a proxima fase
		#se n estava concluida
		if !Niveis.fases[_nivelAtual].concluida:
			Niveis.fases[_nivelAtual].concluida = true
			GlobalPlayer.moedas += 1
			
		#deixa o menor
		if Niveis.fases[_nivelAtual].melhorPontuacao == 0:
			Niveis.fases[_nivelAtual].melhorPontuacao = _totalErros + 1
				
		elif Niveis.fases[_nivelAtual].melhorPontuacao >_totalErros + 1:
			Niveis.fases[_nivelAtual].melhorPontuacao = _totalErros + 1
			
		#mostra o sprite
		estrelasTextura.texture = arrayTexturas[_totalErros+1]
		
		#testa se n é o ultimo nivel
		if !Niveis.faseAtual.final:
			Niveis.fases[_nivelAtual+1].liberada = true
		#se for o ultimo nivel
		else:
			
			#falta testar
			GlobalPlayer.hatsDesbloqueados.append(preload("uid://cdmh2bdqw5bk0"))
			
		
		
	
