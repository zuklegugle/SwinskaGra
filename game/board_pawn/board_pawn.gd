class_name BoardPawn extends PathFollow2D


# Called when the node enters the scene tree for the first time.
func _ready():
	rotates = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progress += 100 * delta
