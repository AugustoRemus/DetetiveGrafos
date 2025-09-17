extends Panel

var teste

@export var curva: Curve

var tempo: float = 0.0
@export var velocidade: float = 0.005

func _ready() -> void: 
	teste = self.get("theme_override_styles/panel")

func _physics_process(delta: float) -> void:
	tempo += delta * velocidade
	if tempo > 0.098:
		tempo = 0
	# Pega valores da curva
	var posX = curva.sample(tempo) 
	var posY = curva.sample(tempo)

	# Aplica diretamente no StyleBoxFlat
	teste.texture.fill_to =Vector2(posX,posY)#.normalized()
