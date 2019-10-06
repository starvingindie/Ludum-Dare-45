extends Node2D
var heart = load("res://Heart.tscn")
var playing_hearts = true
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not playing_hearts:
		get_node("RichTextLabel").text = "THAT'S WHEN LOVE WAS CREATED"
#	pass


func _on_Timer_timeout():
	if playing_hearts:
		get_node("HeartTimer").start(0.1)
		var heart_spawn = heart.instance()
		heart_spawn.position.x = randi() % 600 + 20
		heart_spawn.position.y = randi() % 100 + 300
		add_child(heart_spawn)
	pass # Replace with function body.


func _on_TextTimer_timeout():
	playing_hearts = false
	pass # Replace with function body.
