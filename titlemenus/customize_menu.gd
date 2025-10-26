extends Control
var mainMenu = load("res://titlemenus/title_menu_main.tscn")
@onready var waffle = get_parent().get_node("Waffle")

func _on_customize_pressed() -> void:
	get_parent().add_child(mainMenu.instantiate())
	queue_free()


func _on_waffle_button_pressed() -> void:
	Global.playermodel=0
	waffle.updatemodel()

func _on_bread_button_pressed() -> void:
	Global.playermodel=1
	waffle.updatemodel()
