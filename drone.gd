extends RigidBody3D

@export var m:float = 20
@export var max_speed:float = 25
@export var spin_up_speed:float = 0.2
@export var turn_speed:float = 5.0

var moveUp:bool = false


func _physics_process(delta: float) -> void:
	var up = global_transform.basis.y
	var forward = -global_transform.basis.z
	var reverse = global_transform.basis.z

	if Input.is_action_pressed("up"):		
		linear_velocity += (max_speed * up * delta)
	if Input.is_action_pressed("forward"):
		linear_velocity += (max_speed * forward * delta)
	if Input.is_action_pressed("reverse"):
		linear_velocity += (max_speed * reverse * delta)
	
	if Input.is_action_pressed("left") or Input.is_action_pressed("right"):
		
		var direction = Input.get_axis("left", "right")
		
		rotate(Vector3.UP, deg_to_rad(turn_speed) * -direction)


func moveUpDrone() -> void:
	moveUp = true
