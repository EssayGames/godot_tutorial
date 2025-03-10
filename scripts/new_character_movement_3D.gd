extends CharacterBody3D


const SPEED = 2.0
const JUMP_VELOCITY = 4.5

@export var mouse_s : float = 0.002

func _ready():
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _input(event):
	if event is InputEventMouseMotion and Input.mouse_mode == Input.MOUSE_MODE_CAPTURED:
		rotate_y(-event.relative.x * mouse_s)
		$CollisionShape3D/Camera3D.rotate_x(-event.relative.y * mouse_s)
		$CollisionShape3D/Camera3D.rotation.x = clampf($CollisionShape3D/Camera3D.rotation.x, -deg_to_rad(70), deg_to_rad(70))

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("left", "right", "up", "down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	
	if $CollisionShape3D/Camera3D/RayCast3D.is_colliding():
		var col_obj = $CollisionShape3D/Camera3D/RayCast3D.get_collider().get_parent()
		print(col_obj)
