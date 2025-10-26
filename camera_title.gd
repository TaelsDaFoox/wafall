extends Camera3D
@export var player: RigidBody3D
var camspin = 0.0
var camdist = 20.0

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	if player:
		camspin +=delta*0.3
		player.apply_torque(Vector3(1.0,0.1,0.3))
		#player.linear_velocity.y=-250
		position = Vector3(sin(camspin)*camdist,player.position.y-10,cos(camspin)*camdist)
		look_at(player.position+Vector3(0,6,0),Vector3.UP)
		rotation.y-=0.5
