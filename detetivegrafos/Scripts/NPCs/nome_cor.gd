extends Label

@onready var base_np_cs: CharacterBody2D = $".."

func _ready() -> void:
	##seta o texto com o nome
	text = base_np_cs.resourceNPC.RnomeCor
