extends CanvasLayer

@export var tempo: float

signal acabouTempo


var rodando = true

@export var labelTempo: Label

#daria pra fazer um script pra procurar
@export var grafoPlayer: CanvasLayer


func  _ready() -> void:
	#ajusta dificuldade
	if Niveis.dificuldade == 1:
		tempo = tempo + 30
	if Niveis.dificuldade == 0:
		tempo = tempo + 60
		


#ser um pouco mais perdoavel se pa
func _process(delta: float) -> void:
	if rodando:
		tempo -= delta
		labelTempo.text = str(int(tempo))
		if tempo <= 0:
			grafoPlayer.entregar()
			rodando = false
			
			
func pausar():
	rodando = false
	
func continuar():
	rodando = true
