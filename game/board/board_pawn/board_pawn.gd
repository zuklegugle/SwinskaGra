class_name BoardPawn extends PathFollow2D

var player_id : int # id of the player this pawn belongs to
var board_position : int = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	rotates = false
