extends Node2D

var player = preload("res://scenes/player.tscn")

func init(key_up : StringName, key_left: StringName, key_right: StringName, color : Color, pos : Vector2):
	var instance = player.instantiate()
	instance.position = pos
	#instance.color = color
	#instance.setup(key_up, key_left, key_right)
	
	add_child(instance)
	

# Called when the node enters the scene tree for the first time.
func _ready():
	init("move_up_player1", "move_left_player1", "move_right_player1", Color( randf(), randf(), randf()), Vector2(312, -2))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
