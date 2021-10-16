# From https://www.youtube.com/watch?v=WkpYOmI1xKE 
extends Node

# Help keep track of current scene
var currentScene = null 


# update enemy state from notHappy to happy 



func updateEnemyState():
	pass 


func _ready():
	currentScene = get_tree().get_root().get_child(get_tree().get_root().get_child_count()-1)
	Global.set("MAX_POWER_LEVEL", 100) 
	

#Transition to another scene
func setScene(scene):
	currentScene.queue_free()
	var s = ResourceLoader.load(scene)
	currentScene = s.instance()
	get_tree().get_root().add_child(currentScene)

