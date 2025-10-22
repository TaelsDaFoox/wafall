extends CSGTorus3D
@export var player: RigidBody3D
func _physics_process(delta: float) -> void:
	position.y = player.position.y
