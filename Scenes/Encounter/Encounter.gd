extends Sprite




# Called when the node enters the scene tree for the first time.
func _ready():
	#For testing only 
	won()
	#lost()
	pass

func won():
	# Yay! change to enemy global variable to happy 
	get_node("/root/Global").set_enemy_happy() 
	# Go back to previous scene # TODO 
	get_node("/root/Global").setScene("res://Scenes/Main/MainLevel.tscn") 
	
