extends AnimatedSprite

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= 25 * delta
#	pass


func _on_Timer_timeout():
	animation = "disappear"
	pass # Replace with function body.


func _on_AnimatedSprite_animation_finished():
	if animation == "disappear":
		queue_free()
	pass # Replace with function body.
