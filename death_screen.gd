extends Control
@onready var scoreLabel = $ScoreLabel
func _ready() -> void:
	scoreLabel.text=str(int(floor(Global.falldist/20)))

func _on_restart_button_pressed() -> void:
	get_tree().reload_current_scene()

func _on_menu_button_pressed() -> void:
	get_tree().change_scene_to_file("res://title_alt.tscn")
