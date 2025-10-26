extends AudioStreamPlayer

func _process(delta: float) -> void:
	if Global.musiccringe:
		volume_db=lerp(volume_db,-8.0,delta*2.0)
		pitch_scale=lerp(pitch_scale,0.3,delta*2.0)
	else:
		volume_db=lerp(volume_db,-5.0,delta*2.0)
		pitch_scale=lerp(pitch_scale,1.0,delta*2.0)
