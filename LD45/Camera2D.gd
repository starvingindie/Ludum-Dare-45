extends Camera2D
var shake_amount = 2.0
var is_shaking = false
var timer = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if GlobalScript.needs_camera_shake == true:
		is_shaking = true
		
	if is_shaking:
		timer += 1
		set_offset(Vector2(rand_range(-1.0, 1.0) * shake_amount, rand_range(-1.0, 1.0) * shake_amount))
		
	if timer >= 10:
		GlobalScript.needs_camera_shake = false
		is_shaking = false
		timer = 0
