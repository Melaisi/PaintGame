# From https://www.youtube.com/watch?v=WkpYOmI1xKE 
# when running a scene here there is a global node called root
# the scene will be hosted as child of root 
# global therefore will be also  a child of root 
#  and swap the other node ( scene ) with another 
#  this way it's value stay through different scene  
extends Node

# Help keep track of current scene
var currentScene  = null
# last player position when entering an encounter
var playerX = 200 
var playerY = 200

############## ENEMY ##################
# update enemy state from notHappy to happy 
# TODO: should be a class 
export var enemy_state : String = "NOT_HAPPY" # initial enemy state 
func update_enemy_state_to(state):
	enemy_state = state 
func set_enemy_not_happy():
	update_enemy_state_to("NOT_HAPPY")
func set_enemy_happy():
	update_enemy_state_to("HAPPY")
	
##############################################

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

