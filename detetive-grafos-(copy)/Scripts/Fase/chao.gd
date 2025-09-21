extends TileMapLayer

#em todo layer de chao de fase tem q ter esse script



#barreira de npc, sempre que botar tem que ter a barreira de npcs

@onready var tileBarreira: TileMapLayer = $"../BarreiraNPCs"

			
#essa funcao vai dizer se a cordenada deve ser atualizada na hora de rodar
#ou vai ficar somente como ta no editor se eu entendi corretamente
func _use_tile_data_runtime_update(coords: Vector2i) -> bool:
	
	if coords in tileBarreira.get_used_cells_by_id(0):
		return true
	return false
	
	
	
func _tile_data_runtime_update(coords: Vector2i, tile_data: TileData) -> void:
	tile_data.set_navigation_polygon(0, null)
