extends Sprite2D

#character base
@onready var base_np_cs: CharacterBody2D = $".."
@onready var silhueta: Sprite2D = $Silhueta

#pode variar se o npc for mais rapido, adicionar no resource
#no bob_speed
var bob_time := 0.0
var bob_speed := 0.4
var bob_height := 3.0
var base_offset


func _ready() -> void:
	bob_speed = base_np_cs.resourceNPC.RbobSpeed
	base_offset = offset


func _physics_process(delta: float) -> void:
	var _ignoaraWarning = delta
	_ignoaraWarning = 1
	
	#vai ver se o npc esta se movendo
	if base_np_cs.velocity != Vector2.ZERO:
		bob_time += bob_speed
		offset.y = base_offset.y + sin(bob_time) * bob_height
		silhueta.offset.y = base_offset.y + sin(bob_time) * bob_height
	else:
		
		offset.y = lerp(offset.y, base_offset.y, 0.2)
		silhueta.offset.y = lerp(offset.y, base_offset.y, 0.2)
		
		
