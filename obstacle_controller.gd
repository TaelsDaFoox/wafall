extends Node3D
var obstacle1 = load("res://obstacles/obstacle_line.tscn")
var obstacle2 = load("res://obstacles/obstacle_checker.tscn")
var obstacle3 = load("res://obstacles/obstacle_hole.tscn")
@export var obstacledist = 200

func _ready() -> void:
	for i in 5:
		spawnObstacleCustom(i*obstacledist+100)

func spawnObstacle():
	var obstacle = newObstacle()
	get_parent().add_child(obstacle)
	obstacle.position.y = -obstacledist*5
	obstacle.rotation.y=randf()*PI*2
	
func spawnObstacleCustom(dist:float):
	var obstacle = newObstacle()
	get_parent().add_child.call_deferred(obstacle)
	obstacle.position.y = -dist
	obstacle.rotation.y=randf()*PI*2
	
func newObstacle():
	match randi_range(1,3):
		1:
			return obstacle1.instantiate()
		2:
			return obstacle2.instantiate()
		3:
			return obstacle3.instantiate()
