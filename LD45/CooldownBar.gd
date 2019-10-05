extends TextureProgress

export var desired_time = 0.2
var timer = 1
var spawn_ready = true

func _ready():
	desired_time = get_parent().cooldown_time
	max_value = desired_time*60
	value = 0

func _process(delta):
	get_parent().position = get_global_mouse_position() + Vector2(5,5)
	value -= 1
	desired_time = get_parent().cooldown_time


func _input(event):
	if event.is_action_pressed("left_click") and value <= 0:
		spawn_ready = true
		max_value = desired_time * 60
		value = desired_time * 60