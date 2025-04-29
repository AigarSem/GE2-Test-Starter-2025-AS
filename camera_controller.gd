extends Camera3D

@export var drone:RigidBody3D
@export var target:Marker3D
@export var targetFPV:Marker3D
# Target for the FPV Camera since I cant figgure out how to face forward :)
@export var targetFPVTarget:Marker3D

# Camera Modes true = Follow / false = First Person Camera
# Press C to change Camera Mode
var camera_mode:bool = true

func _process(delta: float) -> void:
	if camera_mode:
		global_position = lerp(global_position, target.global_position, delta * 10.0)
		look_at(drone.global_position)
	else:
		global_position = targetFPV.global_position
		look_at(targetFPVTarget.global_position)


func _input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("camera_mode_change"):
		camera_mode = !camera_mode
