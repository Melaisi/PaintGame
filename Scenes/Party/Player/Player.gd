extends Area2D

var tile_size = 100
var inputs = {
	"ui_right":Vector2.RIGHT,
	"ui_left":Vector2.LEFT,
	"ui_up":Vector2.UP,
	"ui_down":Vector2.DOWN}

onready var ray = $RayCast2D 

onready var tween = $Tween 
export var speed = 3 

# Called when the node enters the scene tree for the first time.
func _ready():
	position = position.snapped(Vector2.ONE*tile_size)
	position += Vector2.ONE *tile_size/2

func _unhandled_input(event):
	if tween.is_active():
		return
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(inputs[dir])


func move_tween(dir):
	tween.interpolate_property(self, "position",
		position, position + dir * tile_size,
		1.0/speed, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.start()

func move(dir):
	ray.cast_to = dir * tile_size
	ray.force_raycast_update()
	if !ray.is_colliding():
		#position += inputs[dir] * tile_size
		move_tween(dir)

	
