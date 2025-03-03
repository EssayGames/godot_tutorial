extends Node2D

var main_char = load("res://scenes/Character.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	var m_c = main_char.instantiate()
	add_child(m_c)
	m_c.interact.connect(_on_interact.bind($Zone))
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_zone_entered(body):
	if body is CharacterBody2D:
		body.can_interact = true
	pass

func _on_interact(node):
	node.visible = false


func _on_zone_exited(body):
	if body is CharacterBody2D:
		body.can_interact = false
	pass # Replace with function body.
