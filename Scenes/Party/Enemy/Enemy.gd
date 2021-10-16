extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var current_state = "none"
# Called when the node enters the scene tree for the first time.

func _ready():
	print("ENEMY --- READY")
	update_state() 
	


func update_state():
	
	# update state of player from global script 
	current_state = get_node("/root/Global").enemy_state 
	print ("Current State is ", current_state)
	
	# toogle animation based on global state
	if current_state == "HAPPY":
		print("Current state = Happy")
		get_node("AnimatedSprite").play("HAPPY")
	else:
		print ("Current stae != happy")
		get_node("AnimatedSprite").play("NOT_HAPPY")
