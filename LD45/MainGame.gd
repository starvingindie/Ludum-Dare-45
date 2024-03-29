extends Node2D
var click_particles = load("res://Click Particles.tscn")
var human = load("res://Human.tscn")
var heart = load("res://Heart.tscn")
var first_click = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GlobalScript.first_bump:
		LoveBar.visible = true
	pass
	
	if GlobalScript.game_is_over:
		get_tree().change_scene("res://EndScene.tscn")
	
func _input(event):
	if event.is_action_pressed("left_click"):
		if not first_click:
			first_click = true
			Music.playing = true
		if get_node("CooldownBar/TextureProgress").spawn_ready:
			get_node("ClickSound").playing = true
			get_node("CooldownBar/TextureProgress").spawn_ready = false
			spawn_something(human)
		#spawn_something(heart)
			spawn_something(click_particles)
		pass

func spawn_something(something):
	var spawnable = something.instance()
	spawnable.position = get_global_mouse_position()
	add_child(spawnable)