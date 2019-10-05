extends KinematicBody2D
var is_human = true
export var walking_speed = 20
var velocity = Vector2(walking_speed,walking_speed)
var heart = load("res://Heart.tscn")
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	velocity = Vector2((randi() % 2) * walking_speed, (randi() % 2) * walking_speed)
	if (randi() % 2) > 0:
		velocity.x *= -1
	if (randi() % 2) > 0:
		velocity.y *= -1
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):	
	if velocity.x > 0:
		get_node("HumanSprites").flip_h = true
	else:
		get_node("HumanSprites").flip_h = false
	pass
	
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		if collision.collider.get_filename() == "res://Human.tscn" and collision.collider != null:
			
			if not GlobalScript.first_bump:
				GlobalScript.first_bump = true
				
			call_shake_camera()
			
			collision.collider.get_node("HumanSprites").animation = "hit"
			collision.collider.get_node("HumanSprites").playing = true
			get_node("HumanSprites").animation = "hit"
			get_node("HumanSprites").playing = true
			
			var spawn_heart = heart.instance()
			spawn_heart.position = get_node("HumanSprites").position
			add_child(spawn_heart)
			
		var reflect = collision.remainder.bounce(collision.normal)
		velocity = velocity.bounce(collision.normal)
		move_and_collide(reflect)
		
func call_shake_camera():
	GlobalScript.needs_camera_shake = true