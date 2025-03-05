extends Area3D

@export var door_to_open : Node
signal play_door_anim(anim_name)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_door_zone_enter(body):
	if body.is_in_group("player"):
		#door_to_open.get_node("door-sliding-double-wide/AnimationPlayer").play("open")
		play_door_anim.emit("open")
	pass # Replace with function body.


func _on_door_zone_exit(body):
	if body.is_in_group("player"):
		play_door_anim.emit("close")
		#door_to_open.get_node("door-sliding-double-wide/AnimationPlayer").play("close")
	pass # Replace with function body.
	
