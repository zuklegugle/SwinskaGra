class_name PawnController extends Node

@export var pawn_scene : PackedScene

@export var board_path : BoardPath

signal pawn_move_started( pawn : BoardPawn )
signal pawn_move_finished( pawn : BoardPawn )

func create_pawn() -> BoardPawn:
	if pawn_scene:
			var new_pawn = pawn_scene.instantiate() as BoardPawn
			new_pawn.rotates = false
			print("Pawn Created!")
			return new_pawn
	else:
		return null

func add_pawn( board_position : int ) -> BoardPawn:
	var new_pawn = create_pawn()
	board_path.add_child( new_pawn )
	set_pawn_position(new_pawn, board_position)
	return new_pawn

func set_pawn_position( pawn : BoardPawn, board_position : int) -> void:
	if board_position in range(0, board_path.tile_board.tiles.size() - 1):
		pawn.progress = board_path.curve.get_closest_offset( board_path.curve.get_point_position( board_position) )
		pawn.board_position = board_position

func move_pawn_to_board_position( pawn : BoardPawn, board_position : int, speed = .25) -> void:
	if board_position in range(0, board_path.tile_board.tiles.size() - 1):
		var pos_diff = board_position - pawn.board_position
		var tween = get_tree().create_tween()
		tween.tween_property(pawn, "progress", board_path.curve.get_closest_offset( board_path.curve.get_point_position( board_position) ), speed * abs(pos_diff))
		pawn_move_started.emit( pawn )
		# wait till pawn finish their movement
		await tween.finished
		pawn.board_position = board_position
		pawn_move_finished.emit( pawn )
		print("tween finished")
	else:
		push_error("board position outside bounds")
