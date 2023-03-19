class_name BoardPath extends Path2D

@export var debug : bool = true
@export var tile_board : TileBoard

# METHODS
func generate_path() -> Curve2D:
	if tile_board:
		var new_curve = Curve2D.new()
		for tile in tile_board.tiles:
			new_curve.add_point(tile.position)
		curve = new_curve
		return new_curve
	else:
		if debug:
			push_warning("TileBoard doesnt exists")
		return null

func generate_path_from_tile_board(board : TileBoard) -> Curve2D:
	if board:
		var new_curve = Curve2D.new()
		for tile in board.tiles:
			new_curve.add_point(tile.position)
		return new_curve
	else:
		if debug:
			push_warning("TileBoard doesnt exists")
		return null

func _draw():
	if debug:
		draw_polyline(curve.get_baked_points(), Color.CORNFLOWER_BLUE, 3, true)
