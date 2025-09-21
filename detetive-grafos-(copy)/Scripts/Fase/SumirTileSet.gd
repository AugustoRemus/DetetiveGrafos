extends TileMapLayer

#esta é a barreira que impede que os npcs andem em certo bloco

func _use_tile_data_runtime_update(coords: Vector2i) -> bool:
	
	return true


#fica transparente
func _tile_data_runtime_update(coords: Vector2i, tile_data: TileData) -> void:
	tile_data.modulate = Color(1, 1, 1, 0)
