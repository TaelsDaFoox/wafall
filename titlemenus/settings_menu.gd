extends Control
@onready var volslider = $VolumeSlider
@onready var musicdropdown = $MusicSelect
var mainMenu = load("res://titlemenus/title_menu_main.tscn")

func _ready() -> void:
	volslider.grab_focus()
	volslider.value = Global.volslider
	musicdropdown.selected=Global.songID
func _on_volume_slider_value_changed(value: float) -> void:
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), pow(value,2.0)*sign(value))
	if value==volslider.min_value:
		AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),-1000.0)
	Global.volslider=value


func _on_done_button_pressed() -> void:
	get_parent().add_child(mainMenu.instantiate())
	queue_free()


func _on_music_select_item_selected(index: int) -> void:
	MusicPlayer.ChangeSongTo(index)
	Global.songID = index
