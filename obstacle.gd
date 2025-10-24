extends CSGBox3D

func _ready() -> void:
	Global.wrap.connect(wrap)
func wrap():
	position.y+=20
	if position.y>80:
		$"../ObstacleController".spawnObstacle()
		queue_free()
