extends Camera3D
@export var player: RigidBody3D
func _physics_process(delta: float) -> void:
	position = position.lerp(player.position*Vector3(0.8,1,0.8)+Vector3(0,30,0),1)
	#look_at(player.position,Vector3.UP)
	#rotation.y=0
