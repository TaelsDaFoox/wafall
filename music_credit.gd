extends Label

func _process(delta: float) -> void:
	match Global.songID:
		0:
			text='John "Joy" Tay - Delve!!!'
		1:
			text="hkmori - anybody can find love (except you.)"
