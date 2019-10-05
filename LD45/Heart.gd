extends AnimatedSprite
var speed = 75
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	LoveBar.get_node("TextureProgress").value += 1
	playing = true
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= speed * delta
#	pass
