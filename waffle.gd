extends RigidBody3D
@export var movespeed := 1.0
var falldistextra :=0.0
@onready var explosion = $explosion
var explodeframe := 19.0
@onready var sfx := $AudioStreamPlayer
@export var healrate = 0.5
func _physics_process(delta: float) -> void:
	Global.waffleHP=clampf(Global.waffleHP+(healrate*delta),0.0,100.0)
	var input_dir = Input.get_vector("left","right","up","down",0.5)
	apply_central_force(Vector3(input_dir.x,0,input_dir.y)*(delta*movespeed))
	apply_torque(Vector3(input_dir.y,0,-input_dir.x)*(delta*movespeed))
	#print(input_dir)
	if position.y<20:
		position.y+=20
		falldistextra+=20
		Global.emitwrap()
	Global.falldist = -position.y+falldistextra
	if explodeframe < 19:
		explodeframe+=delta*30
	explosion.frame = int(explodeframe)

func explode():
	Global.waffleHP-=25
	if Global.waffleHP<=0:
		Global.waffleHP=100.0
		get_tree().reload_current_scene()
	sfx.play()
	explodeframe=0.0
	apply_central_impulse(Vector3(0,150,0))
