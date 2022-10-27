extends Node2D
var IntroIsPlayed = false

var music_bus = AudioServer.get_bus_index("Music")
var sfx_bus = AudioServer.get_bus_index("SFX")

func _ready():
	AudioServer.set_bus_volume_db(music_bus, PlayerStats.music_volume)
	AudioServer.set_bus_volume_db(sfx_bus, PlayerStats.sfx_volume)
	
	$AnimationPlayer.play("SponsorIntro")
	yield(get_tree().create_timer(8),"timeout")
	IntroIsPlayed = true
	$AnimationPlayer.play("StoryIntro")
	var new_dialog = Dialogic.start('StoryIntro')
	add_child(new_dialog)
	yield(get_tree().create_timer(59),"timeout")
	next_scene()
	
func _process(delta):
	if IntroIsPlayed:
		if Input.is_action_just_pressed("ui_accept"):
			queue_free()
			next_scene()

func next_scene():
	get_tree().change_scene("res://UI/Title Screen/TitleScreen.tscn")
