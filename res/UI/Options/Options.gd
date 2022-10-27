extends Control
var music_bus = AudioServer.get_bus_index("Music")
var sfx_bus = AudioServer.get_bus_index("SFX")
onready var music_slider = $VBoxContainer/VBoxContainer/H_Divider/Interactables/Sliders/MusicSlider
onready var sfx_slider = $VBoxContainer/VBoxContainer/H_Divider/Interactables/Sliders/SFXSlider

func _ready():
	AudioServer.set_bus_volume_db(music_bus, PlayerStats.music_volume)
	music_slider.value = PlayerStats.music_volume
	
	AudioServer.set_bus_volume_db(sfx_bus, PlayerStats.sfx_volume)
	sfx_slider.value = PlayerStats.sfx_volume
	
func _on_Music_value_changed(value):
	AudioServer.set_bus_volume_db(music_bus, value)
	
	if value == -30:
		AudioServer.set_bus_mute(music_bus, true)
	else:
		AudioServer.set_bus_mute(music_bus, false)

	PlayerStats.music_volume = value


func _on_SFXSlider_value_changed(value):
	AudioServer.set_bus_volume_db(sfx_bus, value)
	
	if value == -30:
		AudioServer.set_bus_mute(sfx_bus, true)
	else:
		AudioServer.set_bus_mute(sfx_bus, false)

	PlayerStats.sfx_volume = value
