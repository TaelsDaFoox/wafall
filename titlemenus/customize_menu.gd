extends Control
var mainMenu = load("res://titlemenus/title_menu_main.tscn")
@onready var waffle = get_parent().get_node("Waffle")
#var gamepadded = false
@onready var firstbtn = $GridContainer/WaffleButton
@onready var skinbtns = [$GridContainer/WaffleButton,$GridContainer/BreadButton,$GridContainer/JoltButton,$GridContainer/KirbyButton]

func _on_customize_pressed() -> void:
	var newmenu = mainMenu.instantiate()
	get_parent().add_child(newmenu)
	newmenu.get_node("selectsfx").play()
	queue_free()
	
func _ready() -> void:
	skinbtns[Global.playermodel].grab_focus()
	
#func _unhandled_input(event: InputEvent) -> void:
#	if event.is_action_pressed("gamepad") and not gamepadded:
#		firstbtn.grab_focus()
#		gamepadded=true


func _on_waffle_button_pressed() -> void:
	Global.playermodel=0
	waffle.updatemodel()

func _on_bread_button_pressed() -> void:
	Global.playermodel=1
	waffle.updatemodel()


func _on_jolt_button_pressed() -> void:
	Global.playermodel=2
	waffle.updatemodel()


func _on_kirby_button_pressed() -> void:
	Global.playermodel=3
	waffle.updatemodel()
