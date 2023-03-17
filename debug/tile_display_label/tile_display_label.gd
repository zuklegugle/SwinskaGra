extends Label

@export var board_path : BoardPath

var tile_position = -1

# Called when the node enters the scene tree for the first time.
func _ready():
	if get_parent() is BoardPawn:
		if board_path:
			#tile_position = board_path.get_tile_number_from_position(global_position)
			pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_parent() is BoardPawn:
		if board_path:
			#tile_position = board_path.get_tile_number_from_position(global_position)
			#text = "Tile: " + var_to_str(tile_position)
			pass
