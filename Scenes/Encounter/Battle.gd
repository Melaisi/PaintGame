extends Node2D

var colors = ["red","blue","yellow"]
onready var encounterRef = get_parent().get_parent()

onready var staminaRef = get_node("Player/Stamina")

func _input(event):
	#if enter pressed deal damage to enemy and update stamina 
	if Input.is_action_pressed("ui_accept"):
		deal_damage()



func deal_damage():
	var current_color = colors[get_node("Cursors").current_button]
	var enemy_defeated_by = get_node("Enemy").defeated_by 
	if current_color == enemy_defeated_by : 
		encounterRef.won()
	else:
		staminaRef.decrease_stamina()
		if staminaRef.get_stamina() <= 0:
			encounterRef.loss()
	
