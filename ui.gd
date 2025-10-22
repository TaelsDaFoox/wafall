extends Control
@onready var scoreLabel = $ScoreLabel
func _process(delta: float) -> void:
	scoreLabel.text = str(int(floor(Global.falldist/20)))
