extends Area2D

var tile_size = 100
var inputs = {
	"ui_right":Vector2.RIGHT,
	"ui_left":Vector2.LEFT,
	"ui_up":Vector2.UP,
	"ui_down":Vector2.DOWN}

onready var ray = $RayCast2D 
onready var tween = $Tween 
onready var _transition_rect = $SceneTransitionCanvas/SceneTransition
export var speed = 3.15
var last_dir
var want_to_move = false

# Called when the node enters the scene tree for the first time.
func _ready():
	print(_transition_rect)
	randomize()
	position = position.snapped(Vector2.ONE*tile_size)
	position += Vector2.ONE *tile_size/2

func _process(delta):
	if tween.is_active() == false and want_to_move == true:
		want_to_move = false;
		move(inputs[last_dir])
	
func _input(event):
	for dir in inputs.keys():
		if event.is_action_pressed(dir, true):
			
			if tween.is_active() == false:
				move(inputs[dir])
			else: 
			#check relative position of character in tile
				var x_pos = int(get_position().x) % 100
				var y_pos = int(get_position().y) % 100
				#don't keep moving unless the character is on the outer bounds of the tile
				if 75 < x_pos and x_pos < 25 and 75 < y_pos and y_pos < 25 :
					want_to_move = true
				if last_dir != dir:
				#somewhat concerned that the tween instructions here effect ALL tweens
					want_to_move = true
			if dir != null:
				last_dir = dir

func move(dir):
	if dir.x < 0 :
		$AnimatedSprite.flip_h = true
	else:
		$AnimatedSprite.flip_h = false
		
	ray.cast_to = dir * tile_size
	ray.force_raycast_update()
	if !ray.is_colliding():
		#position += inputs[dir] * tile_size
		move_tween(dir)
		return enemy_encounter()

func move_tween(dir):
	tween.interpolate_property(self, "position",
		position, position + dir * tile_size,
		1.0/speed, Tween.TRANS_QUAD)
	tween.start()
	return "completed"
	
func enemy_encounter():
	var chance = randi() % 101
	print(chance)
	if 0 <= chance and chance <= 15:
		print("encounter")
		_transition_rect.transition_to("res://Scenes/Encounter/Encounter.tscn")
