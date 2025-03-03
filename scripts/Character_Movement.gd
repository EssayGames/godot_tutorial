extends CharacterBody2D

@export var speed : float = 1.0

#VARIABLE ARE AS FOLLOWS:
#var NAME : TYPE = VALUE
#YOU DONT ALWAYS HAVE TO PASS A VALUE TO YOUR VARIABLES
var can_interact : bool = false
signal interact(obj_interact)



# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("up"):
		velocity.y += -speed
	elif Input.is_action_pressed("down"):
		velocity.y += speed
	elif Input.is_action_pressed("left"):
		velocity.x += -speed
	elif Input.is_action_pressed("right"):
		velocity.x += speed
	else:
		velocity = Vector2.ZERO
	
	move_and_slide()
	
	if can_interact and Input.is_action_just_pressed("interact"):
		interact.emit()
		
	
