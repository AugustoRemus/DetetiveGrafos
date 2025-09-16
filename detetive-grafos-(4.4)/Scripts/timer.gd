extends CanvasLayer

@export var tempo: float

signal acabouTempo


var rodando = true

@export var labelTempo: Label

#ser um pouco mais perdoavel se pa
func _process(delta: float) -> void:
	if rodando:
		tempo -= delta
		labelTempo.text = str(int(tempo))
		if tempo <= 0:
			acabouTempo.emit()
			rodando = false
			
			
func pausar():
	rodando = false
	
func continuar():
	rodando = true
