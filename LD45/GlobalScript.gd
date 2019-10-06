extends Node
var needs_camera_shake = false
var first_bump = false
var human_life_time = 5
var game_is_over = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if LoveBar.get_node("TextureProgress").value >= LoveBar.get_node("TextureProgress").max_value:
		LoveBar.visible = false
		game_is_over = true
		pass
#	pass
