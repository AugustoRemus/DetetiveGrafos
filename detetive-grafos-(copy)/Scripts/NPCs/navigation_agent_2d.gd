extends NavigationAgent2D

@export var base_np_cs: CharacterBody2D 
@export var logica: Node
@export var timer: Timer

var destinoExiste := false

var last_position: Vector2





func _ready():
	#espera pra começar
	startCronometroRand()
	
	#pra n dar erro
	target_position = base_np_cs.global_position
	set_target_position(target_position)



func _physics_process(delta: float) -> void:
	# se ainda n chegou no final
	if not is_navigation_finished():
		#pega proxima posição
		var next_position = get_next_path_position()
		#calcula a direção
		var direction = (next_position - base_np_cs.global_position).normalized()
		#usa direcao para calcular a velocidade
		var _velocity = direction * base_np_cs.speedNPC 
		#redefine a do character body
		base_np_cs.velocity = _velocity
		#chama a funcao para se mover do character body
		
		base_np_cs.move_and_slide()
		
		#ta travado
		if last_position == base_np_cs.position:
			print("to travado")
		else:
			last_position = base_np_cs.position
		
		

		
	#chegou no final, fica parado
	else:
		#isso serve para chamar a func de escolher destino apenas 
		#uma vez
		if destinoExiste == true:
			destinoExiste = false
			#inicia o timer
			startCronometroRand()
			#print("cheguei")
			
		#zera velocidade
		base_np_cs.velocity = Vector2.ZERO
		#chama a funcao para se mover do character body
		base_np_cs.move_and_slide()
		
		
		
	#tira warning
	var _tiraWarning = delta
	_tiraWarning =" SAIA"

#starta o cronometro com um tempo do range
func startCronometroRand():
		#starta
		timer.start(randf_range(base_np_cs.tempoEsperaMin,base_np_cs.tempoEsperaMax)) 


#timer deu
func _on_timer_destino_timeout() -> void:
	#chama a func da logica pra pegar novo ponto
	target_position = logica.getNewPoit()
	#seta o target
	set_target_position(target_position)
	#para apenas chamar uma vez quando chegar
	destinoExiste = true
