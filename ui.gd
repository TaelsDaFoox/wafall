extends Control
@onready var scoreLabel = $ScoreLabel
@onready var healthbar = $Healthbar
func _process(delta: float) -> void:
	scoreLabel.text = str(int(floor(Global.falldist/20)))
	healthbar.size.x=lerpf(healthbar.size.x,(Global.waffleHP/100.0)*get_viewport_rect().size.x-8,delta*10)
	healthbar.color.h=(healthbar.size.x/(get_viewport_rect().size.x-8))*0.4
