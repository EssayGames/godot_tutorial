extends Node3D

var main_character = load("res://scenes/character3D.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var mc = main_character.instantiate()
	add_child(mc)
	mc.global_position = $Start.global_position
	mc.scale = $Start.scale
	
	mc.door_interact.connect(_door_open.bind($door_switch.door_to_interact))
	
	SingletonTest._name_singleton("Poop")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_door_anim(anim_name):
	$"Room_1/wall_doorway/door-sliding-double-wide/AnimationPlayer".play(anim_name)
	pass # Replace with function body.
	
func _door_open(door):
	door._open()
