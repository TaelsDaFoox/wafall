extends Control
@onready var scoreLabel = $ScoreLabel
#var gamepadded = false
@onready var firstbtn = $HBoxContainer/RestartButton
@onready var highscoretext = $HighScore
func _ready() -> void:
	var score = int(floor(Global.falldist/20))
	if score > Global.highscore:
		Global.highscore=score
	scoreLabel.text=str(score)
	highscoretext.text="High Score: "+str(Global.highscore)
	firstbtn.grab_focus()

#func _unhandled_input(event: InputEvent) -> void:
#	if event.is_action_pressed("gamepad") and not gamepadded:
#		firstbtn.grab_focus()
#		gamepadded=true


func _on_restart_button_pressed() -> void:
	get_tree().reload_current_scene()

func _on_menu_button_pressed() -> void:
	Global.canMove=false
	get_tree().change_scene_to_file("res://title_alt.tscn")
