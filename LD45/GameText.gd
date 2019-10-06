extends RichTextLabel
var current_text = 0
var cooldown_bar
var is_ready = true
var timer = 1.0
var mod_value = 0.5
# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	modulate.a = 0.5
	cooldown_bar = get_parent().get_node("CooldownBar")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	timer += delta
	if timer >= 0.5 and text != "FATE WANTED THE CREATIONS TO BUMP INTO EACH OTHER":
		timer = 0.0
		if modulate.a > 0:
			modulate.a -= 0.035
	
	if current_text == 6 and is_ready and GlobalScript.first_bump:
		modulate.a = mod_value
		is_ready = false
		current_text += 1
		text = "WHEN THE CREATIONS CONNECTED, SOMETHING SPECIAL HAPPENED..."
		get_node("Timer").start(1)
	pass

func _input(event):
	if event.is_action_pressed("left_click"):
		if current_text == 0 and is_ready:
			modulate.a = mod_value
			is_ready = false
			get_node("Timer").start(6)
			current_text += 1
			text = "...AND THEN FATE CREATED SOMETHING BEAUTIFUL"
			cooldown_bar.cooldown_time = 1
			
		if current_text == 2 and is_ready:
			modulate.a = mod_value
			is_ready = false
			text = "SO, FATE DECIDED TO CREATE MORE"
			current_text += 1
			get_node("Timer").start(1)
			cooldown_bar.cooldown_time -= -0.5
			
			
		if current_text == 3 and is_ready:
			modulate.a = mod_value
			is_ready = false
			current_text += 1
			text = "...AND MORE"
			get_node("Timer").start(1)
		
		if current_text == 4 and is_ready:
			modulate.a = mod_value
			is_ready = false
			current_text += 1
			text = "...FATE COULDN'T STOP CREATING"
			get_node("Timer").start(1)
			cooldown_bar.cooldown_time = 0.1
			
		if current_text == 5 and is_ready:
			modulate.a = mod_value
			is_ready = false
			current_text += 1
			text = "FATE WANTED THE CREATIONS TO BUMP INTO EACH OTHER"
			get_node("Timer").start(1)
			

func _on_Timer_timeout():
	is_ready = true
	
	if current_text == 1 and is_ready:
		modulate.a = mod_value
		is_ready = false
		get_node("Timer").start(0.5)
		current_text += 1
		text = "BUT NOTHING LASTS FOREVER."
		GlobalScript.human_life_time = 10
	pass # Replace with function body.
