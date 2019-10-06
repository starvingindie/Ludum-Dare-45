extends AnimatedSprite
var life = 5
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.


func _on_Timer_timeout():
	animation = "dead"
	pass # Replace with function body.


func _on_HumanSprites_animation_finished():
	if animation == "dead":
		get_owner().queue_free()
	if animation == "hit":
		animation = "default"
	pass # Replace with function body.
