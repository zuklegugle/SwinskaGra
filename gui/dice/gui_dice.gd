class_name GUIDice extends TextureButton

@export var value_textures : Array[Texture2D]

@onready var animation_player = $AnimationPlayer

var value = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	animation_player.play("ready")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	value = randi_range(0,5)
	animation_player.play("roll")


func _on_animation_player_animation_finished(anim_name):
	animation_player.play("ready")
	texture_normal = value_textures[value]
