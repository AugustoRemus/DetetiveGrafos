extends TextureButton

@export var npc = CharacterBody2D
@export var silhueta = Texture 
@export var silhuetaAmarela = Texture 

@export var labelNome= Label

var _id

var clicado = false

var texturaNormal
var texturaHover
var texturaClicado


func setarTextura(sprite):
	
	texturaNormal = sprite.Rsprite
	texturaHover = combinar_texturasHover(sprite.Rsprite)
	texturaClicado = combinar_texturasClicado(sprite.Rsprite)
	texture_normal = texturaNormal 
	texture_hover = texturaHover
	labelNome.text = sprite.RnomeCor


func combinar_texturasHover(tex1: Texture2D) -> Texture:
	#cria uma imagem baseada na textura principal
	var img = tex1.get_image().duplicate()
	var base_size = img.get_size()

	#copia a silhueta em cima
	var img_sombra = silhueta.get_image().duplicate()
	img.blend_rect(img_sombra, Rect2(Vector2.ZERO, img_sombra.get_size()), Vector2.ZERO)

	#converte
	return ImageTexture.create_from_image(img)


func combinar_texturasClicado(tex1: Texture2D) -> Texture:
	#cria uma imagem baseada na textura principal
	var img = tex1.get_image().duplicate()

	var base_size = img.get_size()

	#copia a silhueta em cima
	var img_sombra = silhuetaAmarela.get_image().duplicate()
	img.blend_rect(img_sombra, Rect2(Vector2.ZERO, img_sombra.get_size()), Vector2.ZERO)

	#converte
	return ImageTexture.create_from_image(img)


func _on_pressed() -> void:
	#print("voce clicou agorora no id:")
	#print(_id)
	
	if clicado:
		#foi clicado novamente
		voltarNormal()
	else:
		#foi selecionado
		clicado = true
		texture_normal = texturaClicado
		fuiClicado(true)


func fuiClicado(condicao):
	if condicao:
		#passa o id e a posicao atua dele para desenhar a linha
		var posicaoCerta = global_position + (size / 2)
		get_parent().get_parent().addAresta(_id, posicaoCerta)
	if !condicao:
		get_parent().get_parent().resetClicado()
	
func voltarNormal():
	clicado = false
	texture_normal = texturaNormal
	fuiClicado(false)
