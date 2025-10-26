extends Control
var customizeMenu = load("res://titlemenus/customize_menu.tscn")

func _ready() -> void:
	Global.canMove=false
func _on_start_pressed() -> void:
	Global.canMove=true
	get_tree().change_scene_to_file("res://world.tscn")


func _on_customize_pressed() -> void:
	get_parent().add_child(customizeMenu.instantiate())
	queue_free()
