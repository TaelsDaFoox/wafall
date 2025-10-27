extends RigidBody3D
@export var movespeed := 1.0
var falldistextra :=0.0
@onready var explosion = $explosion
var explodeframe := 19.0
@onready var sfx := $ExplodeSFX
@export var healrate = 0.5
@onready var dangersfx = $DangerSFX
@onready var dangerspr = $danger
var wafflemodel = load("res://models/waffle.glb")
var breadmodel = load("res://models/bread.glb")
var kirbymodel = load("res://models/mr dreamland.glb")
var joltmodel = load("res://models/jolt email sit.glb")
var alive=true
var dieVel:=Vector3.ZERO
@onready var collision = $CollisionShape3D
@onready var model = $model
@onready var fallsfx = $FallSFX
var deathscreen = load("res://death_screen.tscn")
@onready var dangertimer = $DangerTimer
func _ready() -> void:
	Global.musiccringe=false
	updatemodel()
	if Global.canMove==true:
		fallsfx.play()
func updatemodel():
	model.queue_free()
	match Global.playermodel:
		0:
			model = wafflemodel.instantiate()
		1:
			model = breadmodel.instantiate()
		2:
			model = joltmodel.instantiate()
		3:
			model = kirbymodel.instantiate()
	add_child(model)
func _physics_process(delta: float) -> void:
	if not alive:
		linear_velocity=dieVel
		#no idea why Vector3.lerp was deciding to just not work at all
		dieVel.x=lerpf(dieVel.x,0.0,delta*3.0)
		dieVel.y=lerpf(dieVel.y,0.0,delta*3.0)
		dieVel.z=lerpf(dieVel.z,0.0,delta*3.0)
	else:
		Global.waffleHP=clampf(Global.waffleHP+(healrate*delta),0.0,100.0)
	if Global.waffleHP<30.0 and alive:
		if not dangersfx.playing:
			if dangertimer.is_stopped():
				dangertimer.start()
				dangersfx.playing=true
		if dangertimer.time_left>0.4:
			dangerspr.visible=true
		else:
			dangerspr.visible=false
	else:
		dangerspr.visible=false
		dangersfx.playing=false
	var input_dir = Input.get_vector("left","right","up","down",0.5)
	if not Global.canMove or not alive:
		input_dir=Vector2.ZERO
	apply_central_force(Vector3(input_dir.x,0,input_dir.y)*(delta*movespeed))
	apply_torque(Vector3(input_dir.y,0,-input_dir.x)*(delta*movespeed))
	#print(input_dir)
	if alive:
		if position.y<20:
			position.y+=20
			falldistextra+=20
			Global.emitwrap()
		Global.falldist = -position.y+falldistextra
	if explodeframe < 19:
		explodeframe+=delta*30
	explosion.frame = int(explodeframe)

func explode():
	Global.waffleHP-=30.0
		#get_tree().reload_current_scene()
	sfx.play()
	explodeframe=0.0
	apply_central_impulse(Vector3(0,150,0))
	if Global.waffleHP<=0 and alive:
		Global.musiccringe=true
		alive=false
		collision.disabled=true
		model.visible=false
		dieVel=linear_velocity
		await get_tree().create_timer(1.0).timeout
		get_parent().get_node("UI").queue_free()
		Global.waffleHP=100.0
		get_parent().add_child(deathscreen.instantiate())


func _on_danger_timer_timeout() -> void:
	dangersfx.playing=true
