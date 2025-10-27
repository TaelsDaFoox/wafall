extends Control
var customizeMenu = load("res://titlemenus/customize_menu.tscn")
var settingsMenu = load("res://titlemenus/settings_menu.tscn")
#var gamepadded = false
@onready var firstbtn =$VBoxContainer/Start

func _ready() -> void:
	Global.canMove=false
	firstbtn.grab_focus()
func _on_start_pressed() -> void:
	Global.canMove=true
	get_tree().change_scene_to_file("res://world.tscn")


func _on_customize_pressed() -> void:
	get_parent().add_child(customizeMenu.instantiate())
	queue_free()

#func _unhandled_input(event: InputEvent) -> void:
#	if event.is_action_pressed("gamepad") and not gamepadded:
#		firstbtn.grab_focus()
#		gamepadded=true


func _on_settings_pressed() -> void:
	get_parent().add_child(settingsMenu.instantiate())
	queue_free()
