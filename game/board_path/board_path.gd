class_name BoardPath extends Path2D

@export var debug : bool = true
@export var tile_board : TileBoard


# CALLBACKS
func _ready():
	if tile_board:
		curve = generate_path()
		if debug:
			print_debug("Found TileBoard, path generated")
		move_pawn_to_board_position( get_child(0), 3, 1)
	else:
		print_debug("TileBoard not set, couldn't generate path")

# METHODS
func generate_path() -> Curve2D:
	if tile_board:
		var new_curve = Curve2D.new()
		for tile in tile_board.tiles:
			new_curve.add_point(tile.position)
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

func move_pawn_to_board_position( pawn : BoardPawn, board_position : int, speed = .25) -> void:
	if board_position in range(0, tile_board.tiles.size() - 1):
		var pos_diff = board_position - pawn.board_position
		var tween = get_tree().create_tween()
		tween.tween_property(pawn, "progress", curve.get_closest_offset( curve.get_point_position( board_position) ), speed * abs(pos_diff))
		await tween.finished
		print("tween finished")
	else:
		push_error("board position outside bounds")

func _draw():
	if debug:
		draw_polyline(curve.get_baked_points(), Color.CORNFLOWER_BLUE, 3, true)
