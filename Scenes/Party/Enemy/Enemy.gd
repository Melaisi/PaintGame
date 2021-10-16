extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var current_state = "none"
# Called when the node enters the scene tree for the first time.
func _ready():
	update_state() 

func update_state():
	# update state of player from global script 
	current_state = get_node("/root/Global").enemy_state 
	
	# Make sure both state not visible 
	get_node("notHappy").visible = false
	get_node("Happy").visible = false
	
	# toogle visibility based on global state
	if current_state == "HAPPY":
		get_node("Happy").visible = true
	else:
		get_node("notHappy").visible = true
