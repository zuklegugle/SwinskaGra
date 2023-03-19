class_name TileBoard extends Node2D

@export var debug : bool = true 

var tiles : Array[BoardTile]

# CALLBACKS
func _ready():
	for child in get_children():
		if child is BoardTile:
			add_tile(child)

# METHODS
func add_tile(tile : BoardTile) -> bool:
	if !tiles.has(tile):
		tiles.append(tile)
		tile.tileboard = self
		tile.board_position = tiles.find(tile)
		if debug:
			print_debug("Tile ",tile," added to ",self)
		return true
	else:
		push_warning("Tile is already added to TileBoard")
		return false

func get_tile_from_index(index : int) -> BoardTile:
	if index >= 0 && index < tiles.size():
		var tile = tiles[index] as BoardTile
		return tile
	else:
		push_error("Index out of bounds")
		return null

func get_tile_board_position(tile : BoardTile ) -> int:
	var index = tiles.find(tile)
	return index

func board_position_valid( board_position : int) -> bool:
	if board_position in range(0, tiles.size() - 1):
		return true
	else:
		return false
