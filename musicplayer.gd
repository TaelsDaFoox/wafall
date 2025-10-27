extends AudioStreamPlayer
var music = [load("res://audio/music/Delve!!!.wav"),load("res://audio/music/hkmori - anybody can find love (except you.).mp3"),load("res://audio/music/Toby Fox - Amalgam (PS1 Mix).mp3"),load("res://audio/music/silence.mp3")]

func _process(delta: float) -> void:
	if Global.musiccringe:
		volume_db=lerp(volume_db,-8.0,delta*2.0)
		pitch_scale=lerp(pitch_scale,0.3,delta*2.0)
	else:
		volume_db=lerp(volume_db,-5.0,delta*2.0)
		pitch_scale=lerp(pitch_scale,1.0,delta*2.0)

func ChangeSongTo(songID:int):
	stream=music[songID]
	play()
