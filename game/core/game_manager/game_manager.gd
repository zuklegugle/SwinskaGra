class_name GameManager extends Node

@export var tile_board : TileBoard
@export var board_path : BoardPath
@export var pawn_controller : PawnController

var players : Array[Player]

# PRIVATE VARS
var _id_counter : int = 0

func _ready():
	board_path.generate_path()
	var test_pawn = pawn_controller.add_pawn( 0 )
	pawn_controller.move_pawn_to_board_position( test_pawn, 3, .5)

func add_player( player_name : String) -> void:
	var new_player = Player.new()
	new_player.player_name = player_name
	new_player.player_id = _id_counter
	_id_counter += 1
	add_child(new_player)
	players.append(new_player)
	print("Player [", player_name, "] added")

func get_player(index : int) -> Player:
	return players[index]

func get_player_by_name(player_name : String) -> Player:
	for player in players:
		if player.player_name == player_name:
			return player
	return null
