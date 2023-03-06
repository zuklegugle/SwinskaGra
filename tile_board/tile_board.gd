class_name TileBoard extends Node2D

@export var debug : bool = true 

var tiles : Array[BaseTile]

func _ready():
	for child in get_children():
		if child is BaseTile:
			add_tile(child)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func add_tile(tile : BaseTile) -> bool:
	if tile is BaseTile:
		if !tiles.has(tile):
			tiles.append(tile)
			if debug:
				print_debug("Tile ",tile," added to ",self)
			return true
		else:
			push_warning("Tile is already added to TileBoard")
			return false
	else:
		push_error("Tried adding invalid tile to the TileBoard")
		return false
