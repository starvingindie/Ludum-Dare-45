extends Node2D
var click_particles = load("res://Click Particles.tscn")
var human = load("res://Human.tscn")
var heart = load("res://Heart.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func _input(event):
	if event.is_action_pressed("left_click"):
		spawn_something(human)
		#spawn_something(heart)
		spawn_something(click_particles)
		pass

func spawn_something(something):
	var spawnable = something.instance()
	spawnable.position = get_global_mouse_position()
	add_child(spawnable)