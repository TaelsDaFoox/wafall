extends Node3D
var spinspeed := 0.0
var active=true

func _ready() -> void:
	spinspeed= randf_range(-1,1)
	Global.wrap.connect(wrap)
func wrap():
	position.y+=20
	if position.y>80:
		$"../ObstacleController".spawnObstacle()
		queue_free()


func _on_area_3d_body_entered(body: Node3D) -> void:
	if active:
		body.explode()
		active=false
		visible=false
	#get_tree().reload_current_scene()
	
func _process(delta: float) -> void:
	rotation.y+=spinspeed*delta
