extends AnimatedSprite
var internal_timer = 0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	if (randi() % 2) > 0:
		animation = "alt"
	playing = true
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _on_Click_Particles_animation_finished():
	queue_free()
	pass # Replace with function body.
