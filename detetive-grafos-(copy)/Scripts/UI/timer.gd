extends CanvasLayer

@export var tempo: float

@export var clock: AnimatedSprite2D

var rodando = true

@export var labelTempo: Label

#daria pra fazer um script pra procurar
@export var grafoPlayer: CanvasLayer


func  _ready() -> void:
	#ajusta dificuldade
	
	clock.speed_scale = 1
	


func setTimer(_tempoBase: float):
	tempo = _tempoBase
	if Niveis.dificuldade == 1:
		tempo = tempo + 30
	if Niveis.dificuldade == 0:
		tempo = tempo + 60
	
	tempo = tempo + GlobalPlayer.tempoAdicional
	




#ser um pouco mais perdoavel se pa
func _process(delta: float) -> void:
	if rodando:
		tempo -= delta
		processTime(tempo)
		if tempo <= 0:
			grafoPlayer.entregar()
			rodando = false
			
func processTime(time):
	var minutos = int(time/60)
	var segundos = int(int(time)%60)
	if minutos >= 1:
		labelTempo.text = (str(minutos) + " : " + str(segundos).pad_zeros(2))
	else:
		
		labelTempo.text = (str(segundos))
		if segundos == 59:
			clock.speed_scale = 1.5
			#print("peguei 0")
		if segundos == 30:
			clock.speed_scale = 2
			#print("peguei 1")
		elif segundos == 10:
			clock.speed_scale = 3
			#print("peguei 2")
			
	Matrizes.TempoFinalFase = labelTempo.text
	
		
	
func pausar():
	rodando = false
	
func continuar():
	rodando = true
