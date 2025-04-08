extends CharacterBody3D
var mouse: Vector2 = Vector2.ZERO
func _ready() -> void: Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
func _physics_process(delta: float) -> void:
	velocity = Vector3((transform.basis * Vector3(Input.get_vector("move_left", "move_right", "move_forward", "move_backward").x, 0, Input.get_vector("move_left", "move_right", "move_forward", "move_backward").y)).normalized().x * 5,0,(transform.basis * Vector3(Input.get_vector("move_left", "move_right", "move_forward", "move_backward").x, 0, Input.get_vector("move_left", "move_right", "move_forward", "move_backward").y)).normalized().z * 5)
	move_and_slide()
	rotate_y(mouse.x)
	$ViewPivot.rotate_x(mouse.y)
	$ViewPivot.rotation_degrees.x = clampf($ViewPivot.rotation_degrees.x, -90, 90)
	mouse = Vector2.ZERO
func _input(event: InputEvent) -> void: if event is InputEventMouseMotion: if Input.mouse_mode == Input.MOUSE_MODE_CAPTURED: mouse = -event.relative * 0.001
