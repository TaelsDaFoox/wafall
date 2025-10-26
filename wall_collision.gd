extends CSGTorus3D
@export var player: RigidBody3D
func _physics_process(delta: float) -> void:
	if player:
		position.y = player.position.y
