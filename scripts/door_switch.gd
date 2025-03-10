extends Node3D

@onready var anim = $AnimationPlayer
@export var door_to_interact : Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _press_btn():
	anim.play("toggle")
