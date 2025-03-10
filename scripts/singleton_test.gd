extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	print("THIS IS THE SINGLETON!")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _name_singleton(name):
	self.name = name
	print(self.name)
