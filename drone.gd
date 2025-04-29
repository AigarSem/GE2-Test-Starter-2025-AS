extends RigidBody3D

@export var max_speed:float = 20
@export var max_spin_speed:float = 50
@export var spin_up_speed:float = 2.0
@export var slow_down_speed:float = 0.15
@export var turn_speed:float = 2.5

@onready var props:Array = [$Arm1/Prop, $Arm2/Prop, $Arm3/Prop, $Arm4/Prop]

var current_turn_speed:float = 0.0


func _physics_process(delta: float) -> void:
	var up = global_transform.basis.y
	var forward = -global_transform.basis.z
	var reverse = global_transform.basis.z

	if Input.is_action_pressed("up"):
		linear_velocity += (max_speed * up * delta)
		if current_turn_speed < max_spin_speed:
			current_turn_speed += spin_up_speed
		spin_props()
	else:
		if current_turn_speed < 0.0:
			current_turn_speed = 0.0
		else:
			current_turn_speed -= slow_down_speed
		spin_props()
	
	if Input.is_action_pressed("forward"):
		linear_velocity += (max_speed * forward * delta)
	
	if Input.is_action_pressed("reverse"):
		linear_velocity += (max_speed * reverse * delta)
	
	if Input.is_action_pressed("left") or Input.is_action_pressed("right"):
		var direction = Input.get_axis("left", "right")
		
		rotate(Vector3.UP, deg_to_rad(turn_speed) * -direction)


func spin_props() -> void:
	for prop in props:
		prop.rotate(Vector3.UP, deg_to_rad(current_turn_speed))
