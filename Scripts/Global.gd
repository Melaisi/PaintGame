# From https://www.youtube.com/watch?v=WkpYOmI1xKE 
# when running a scene here there is a global node called root
# the scene will be hosted as child of root 
# global therefore will be also  a child of root 
#  and swap the other node ( scene ) with another 
#  this way it's value stay through different scene  
extends Node

# Help keep track of current scene
var currentScene = null 


# update enemy state from notHappy to happy 



func updateEnemyState():
	pass 


func _ready():
	currentScene = get_tree().get_root().get_child(get_tree().get_root().get_child_count()-1)
	
	

#Transition to another scene 
func setScene(scene):
	currentScene.queue_free()
	var s = ResourceLoader.load(scene)
	currentScene = s.instance()
	get_tree().get_root().add_child(currentScene)

