extends Node2D

var music_bus = AudioServer.get_bus_index("Music")
var sfx_bus = AudioServer.get_bus_index("SFX")

var IsPlayed = false
func _ready():
	AudioServer.set_bus_volume_db(music_bus, PlayerStats.music_volume)
	
	AudioServer.set_bus_volume_db(sfx_bus, PlayerStats.sfx_volume)
	
	$AnimationPlayer.play("StoryIntro")
	var new_dialog = Dialogic.start('StoryIntro')
	add_child(new_dialog)
	yield(get_tree().create_timer(59),"timeout")
	IsPlayed = true

func _process(delta):
	if IsPlayed == true:
		$TransitionScene.transition()
