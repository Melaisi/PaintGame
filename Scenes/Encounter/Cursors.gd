extends Node2D

# Declare member variables here. Examples:

var current_button = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# input control 
func _input(event):
	if Input.is_action_pressed("ui_down"):
		move_cursor(+1)
	if Input.is_action_pressed("ui_up"):
		move_cursor(-1)
# move to the next button in list
 
# dir is either +1 next or -1 back 
func move_cursor(dir):
	current_button = current_button + (dir * 1) 
	var next_button_index = current_button % get_children().size()
	update_cursor(next_button_index)
	
func update_cursor(index):
	for i in range(0,get_children().size()) :
		print(i)
		if i == index:
			get_children()[i].visible = true
		else:
			get_children()[i].visible = false
