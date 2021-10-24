extends Sprite


# Declare member variables here. 
var stamina = 3


# Called when the node enters the scene tree for the first time.
func _ready():
	print (stamina)
	update_stamina_ui() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func decrease_stamina():
	if(stamina <=1):
		stamina = 0
	else:
		stamina = stamina -1 

func get_stamina():
	return stamina

func update_stamina_ui():
	for i in range(0,get_children().size()) :
		print(i)
		if i+1 == stamina:
			get_children()[i].visible = true
		else:
			get_children()[i].visible = false
