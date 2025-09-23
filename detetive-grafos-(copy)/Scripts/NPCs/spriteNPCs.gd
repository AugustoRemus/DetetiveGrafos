extends Sprite2D

#character base
@onready var base_np_cs: CharacterBody2D = $".."
@onready var silhueta: Sprite2D = $Silhueta
@onready var sombra: Sprite2D = $sombra
@onready var hat: Sprite2D = $hat

#pode variar se o npc for mais rapido, adicionar no resource
#no bob_speed
var bob_time := 0.0
var bob_speed := 0.4
var bob_height := 3.0

var base_offset

var base_sombra_scale
var base_sombra_offset



func _ready() -> void:
	bob_speed = base_np_cs.resourceNPC.RbobSpeed
	base_offset = offset
	base_sombra_scale = sombra.scale
	base_sombra_offset = sombra.offset


func _physics_process(delta: float) -> void:
	var _ignoaraWarning = delta
	_ignoaraWarning = 1
	
	#vai ver se o npc esta se movendo
	if base_np_cs.velocity != Vector2.ZERO:
		bob_time += bob_speed
		
		
		var bob = sin(bob_time) * bob_height
		offset.y = base_offset.y + bob
	
		silhueta.offset.y = base_offset.y + bob
	
		
		#ajustando a sombra
		var scale_factor = 1.0 - (bob / (bob_height * 2.0))
		sombra.scale = base_sombra_scale * clamp(scale_factor, 0.95, 1.05)
	else:
		#volta
		offset.y = lerp(offset.y, base_offset.y, 0.2)
		silhueta.offset.y = lerp(offset.y, base_offset.y, 0.2)
	
		#sombra
		sombra.scale = sombra.scale.lerp(base_sombra_scale, 0.2)
		
