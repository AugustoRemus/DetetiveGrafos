extends TileMapLayer

@export var tileBarreira: TileMapLayer = null


func _ready() -> void:
	var todosNodes = get_parent().get_children()
	for nodos in todosNodes:
		if nodos.name == "barreira":
			tileBarreira = nodos
			print(tileBarreira)
			return
			
			
			
func _use_tile_data_runtime_update(coords: Vector2i) -> bool:
	if !tileBarreira:
		return false
	
	if coords in tileBarreira.get_used_cells_by_id(0):
		return true
	return false
	
	
	
func _tile_data_runtime_update(coords: Vector2i, tile_data: TileData) -> void:
	if tileBarreira:
		if coords in tileBarreira.get_used_cells_by_id(0):
			tile_data.set_navigation_polygon(0,null)
