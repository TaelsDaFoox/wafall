extends Node3D
var obstacle1 = load("res://obstacles/obstacle_line.tscn")
@export var obstacledist = 200

func _ready() -> void:
	for i in 5:
		spawnObstacleCustom(i*obstacledist+100)

func spawnObstacle():
	var obstacle = obstacle1.instantiate()
	get_parent().add_child(obstacle)
	obstacle.position.y = -obstacledist*5
	obstacle.rotation.y=randf()*PI*2
	
func spawnObstacleCustom(dist:float):
	var obstacle = obstacle1.instantiate()
	get_parent().add_child.call_deferred(obstacle)
	obstacle.position.y = -dist
	obstacle.rotation.y=randf()*PI*2
