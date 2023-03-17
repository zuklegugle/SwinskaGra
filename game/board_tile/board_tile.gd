class_name BoardTile extends Node2D

@onready var sprite : Sprite2D = $Sprite2D 

var tileboard : TileBoard # tileboard this tile belongs to
var board_position : int  # index of this tile inside tile board
