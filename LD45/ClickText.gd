extends RichTextLabel
var going_down = true
var current_alpha
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	current_alpha = modulate.a
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if modulate.a <= 0 and going_down:
		going_down = false
	if modulate.a >= current_alpha and not going_down:
		going_down = true
#	pass


func _on_FadeTimer_timeout():
	if going_down:
		modulate.a -= 0.025
	if not going_down:
		modulate.a += 0.025
	get_node("FadeTimer").start(0.1)
	pass # Replace with function body.
