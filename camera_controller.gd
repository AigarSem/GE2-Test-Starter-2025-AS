extends Camera3D

@export var drone:RigidBody3D
@export var target:Marker3D


func _process(delta: float) -> void:
	global_position = lerp(global_position, target.global_position, delta * 5.0)
	look_at(drone.global_position)
