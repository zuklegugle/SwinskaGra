class_name InteractiveTile extends BoardTile

signal activated(tile : InteractiveTile)

func activate() -> void:
	_on_activated()
	activated.emit(self)

#what happens when player steps on a tile
func _on_activated() -> void:
	pass
