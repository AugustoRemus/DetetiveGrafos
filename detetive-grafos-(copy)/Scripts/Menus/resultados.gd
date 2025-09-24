extends Control
@onready var debug: Label = $Label

@export var voltarBotao: Button


@export var quantErros: Label
@export var tempoRestante: Label
@export var resultado: Label

@export var estrelasTextura: TextureRect
@export var arrayTexturas: Array[Texture2D]

var _totalErros



func _ready() -> void:
	_totalErros = Matrizes.calcularErro()
	
	quantErros.text = str(_totalErros)
	
	
	tempoRestante.text = Matrizes.TempoFinalFase
	
	var _nivelAtual = Niveis.faseAtual.numero
	
	#falhou
	if _totalErros >= 3:
		resultado.text = "FALHADA!"
		estrelasTextura.texture = arrayTexturas[0]
		return
		#botar label e tals
	else:
		resultado.text = "CONCLUIDA!"
		#seta o nivel e libera a proxima fase
		
		#deixa o menor
		if Niveis.fases[_nivelAtual].melhorPontuacao == 0:
			Niveis.fases[_nivelAtual].melhorPontuacao = _totalErros + 1
				
		elif Niveis.fases[_nivelAtual].melhorPontuacao >_totalErros + 1:
			Niveis.fases[_nivelAtual].melhorPontuacao = _totalErros + 1
			
		#mostra o sprite
		estrelasTextura.texture = arrayTexturas[_totalErros+1]
		
		if _nivelAtual != Niveis.quantNiveis:
			#libera o proximo nivel se n foi o ultimo
			Niveis.fases[_nivelAtual+1].liberada = true
		
	
