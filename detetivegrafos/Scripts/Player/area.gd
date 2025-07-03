extends Area2D

#guarda o corpo atual pra desmarcar se vier um novo
var corpoAtual: CharacterBody2D

#esta parte ele apenas cuida quem ele pode pegar, nao qual ele realmente
#vai pegar


#testa se entrou um corpo e é npc
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Alvo") and body != corpoAtual:
		
		#testa se n ta null
		if corpoAtual == null:
			#seta
			corpoAtual = body
		else:
			#se n tira a silhueta do atua
			corpoAtual.silhueta(0)
		#muda o atual
		corpoAtual = body
		#ativa silhueta do atual
		corpoAtual.silhueta(1)
		

#testa se saiu
func _on_body_exited(body: Node2D) -> void:
	
	if body.is_in_group("Alvo") and body == corpoAtual:
		#print("corpo saiu")
		#tira a silhueta do atual, porem ele esta salvo para
		#ser transformado
		corpoAtual.silhueta(0)
		
		
func getAtual():
	return(corpoAtual)
