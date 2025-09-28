extends Control


var hatSelecionado: hat

#botar aqrquivo na real
@export var hat1: hat
@export var hat2: hat
@export var hat3: hat
@export var hat4: hat
@export var hat5: hat
@export var hat6: hat

@export var labelNome:Label

@export var labelDescricao:Label

@export var sprite: TextureRect

@export var gridPreco: GridContainer
@export var labelDica: Label
@export var botaoUsar: Button
@export var botaoComprar: Button
@export var botaoDesequipar: Button
@export var labelComprarPreco: Label
@export var lalbelTXTCusta: Label

func _ready() -> void:
	#começa mopstrando o atual ou o primeiro

	if GlobalPlayer.hatAtual != null:
		botaoClicado(GlobalPlayer.hatAtual)
	else:
		botaoClicado(hat1)





func botaoClicado(_hat):
	
	hatSelecionado = _hat
	
	labelNome.text = hatSelecionado.nome
	labelDescricao.text = hatSelecionado.descricao
	
	sprite.texture = _hat.sprite
	
	if hatSelecionado == GlobalPlayer.hatAtual:
		#print("reconheceu o mesmo")
		_attBoes(2, "ignorar")
		
		return

	

	
	#tem quer usar
	if GlobalPlayer.hatsDesbloqueados.has(hatSelecionado):
		_attBoes(1, "ignorar")
		return

		
	#nao tem, quer comprar
	if !GlobalPlayer.hatsDesbloqueados.has(hatSelecionado):
		_attBoes(0, _hat)
		return
	
		
	pass
	

# 0 = comprar, 1 = usar, 2= desequipar
func _attBoes(_setar: int, _hat):
	
	if _setar == 0:
		
		#se ele for compravel mostra o valor
		if _hat.compravel:
			
			labelDica.visible = false
			gridPreco.visible = true
		#botar o preco 
			#n tem o dinheiro
			if _hat.preco > GlobalPlayer.moedas:
				botaoComprar.visible = false
				
			#tem o dinheiro
			if _hat.preco <= GlobalPlayer.moedas:
				botaoComprar.visible = true
			#mostra opcao comprar
			gridPreco.visible = true
			labelComprarPreco.visible = true
			lalbelTXTCusta.visible = true
			labelComprarPreco.text = str(_hat.preco)
			
		#se ele n for compravel mostra a dica para desbloquear
		else:
			gridPreco.visible = false
			botaoComprar.visible = false
			#labelComprarPreco.visible = true
			labelDica.visible = true
			labelDica.text = str(_hat.dica)
			
		#esconce o usar
		botaoUsar.visible = false
		#escpnmce desequipar
		botaoDesequipar.visible = false
		
	elif _setar == 1:
		#opcao usar
		
		#mostra opcao usar
		botaoUsar.visible = true
		
		#esconce opcao comprar
		botaoComprar.visible = false
		labelComprarPreco.visible = false
		lalbelTXTCusta.visible = false		
		#esconce opcao desequipar
		botaoDesequipar.visible = false
		
	elif _setar == 2:
		#print("elif")
		#desequipar
		#mostra desequipar
		botaoDesequipar.visible = true
		#esconce botao usar
		botaoUsar.visible = false
		#esconde opcao comprar
		labelComprarPreco.visible = false
		lalbelTXTCusta.visible = false
		botaoComprar.visible = false
		
		#pass
		

func _on_usar_pressed() -> void:
	#se existir o atual
	if GlobalPlayer.hatAtual:
		GlobalPlayer.hatAtual._desEquip()
	
	hatSelecionado._equip()
	GlobalPlayer.hatAtual = hatSelecionado
	
	
	_attBoes(2,"nada")
	
	

func _on_desequipar_pressed() -> void:
	#n deve cair mas pra garantir
	if GlobalPlayer.hatAtual:
		GlobalPlayer.hatAtual._desEquip()
		GlobalPlayer.hatAtual = null
		#desequipei
		_attBoes(1,"nada")
	


func _on_comprar_pressed() -> void:
	
	GlobalPlayer.moedas = GlobalPlayer.moedas - hatSelecionado.preco
	print(GlobalPlayer.moedas )
	GlobalPlayer.hatsDesbloqueados.append(hatSelecionado)
	_attBoes(1,"nada")




func _on_hat_botao_pressed() -> void:
	botaoClicado(hat1)




func _on_hat_botao_2_pressed() -> void:
	botaoClicado(hat2)


func _on_hat_botao_3_pressed() -> void:
	botaoClicado(hat3)
	#print(hat3)


func _on_hat_botao_4_pressed() -> void:
	botaoClicado(hat4)


func _on_hat_botao_5_pressed() -> void:
	botaoClicado(hat5)


func _on_hat_botao_6_pressed() -> void:
	botaoClicado(hat6)
