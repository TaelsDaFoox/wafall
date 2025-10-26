extends Node3D
#var obstacle1 = load("res://obstacles/obstacle_line.tscn")
#var obstacle2 = load("res://obstacles/obstacle_checker.tscn")
#var obstacle3 = load("res://obstacles/obstacle_hole.tscn")
var obstacles = [load("res://obstacles/obstacle_line.tscn"),load("res://obstacles/obstacle_checker.tscn"),load("res://obstacles/obstacle_hole.tscn"),load("res://obstacles/obstacle_cross.tscn"),load("res://obstacles/obstacle_grid.tscn")]
@export var obstacledist = 200

func _ready() -> void:
	for i in 5:
		spawnObstacleCustom(i*obstacledist+100)

func spawnObstacle():
	var obstacle = newObstacle()
	obstacle.position.y = -obstacledist*5
	obstacle.rotation.y=randf()*PI*2
	get_parent().add_child(obstacle)
	
func spawnObstacleCustom(dist:float):
	var obstacle = newObstacle()
	obstacle.position.y = -dist
	obstacle.rotation.y=randf()*PI*2
	get_parent().add_child.call_deferred(obstacle)
	
func newObstacle():
	return obstacles[randi_range(0,obstacles.size()-1)].instantiate()
		
