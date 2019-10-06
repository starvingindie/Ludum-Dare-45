extends Node2D
var heart = load("res://Heart.tscn")
var playing_hearts = true
var credits = false
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not playing_hearts and credits == false:
		credits = true
		get_node("RichTextLabel").text = "FROM NOTHING, FATE CREATED LOVE"
		get_node("TextTimer").start(5)
		
	if credits:
		pass
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
	if playing_hearts == false and credits:
		get_node("RichTextLabel").text = "THANK YOU FOR PLAYING - @GABRIELCORNISH"
	playing_hearts = false
	pass # Replace with function body.
