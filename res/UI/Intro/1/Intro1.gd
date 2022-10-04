extends Node2D
var IntroIsPlayed = false

func _ready():
	
	$AnimationPlayer.play("SponsorIntro")
	yield(get_tree().create_timer(8),"timeout")
	IntroIsPlayed = true
	$AnimationPlayer.play("StoryIntro")
	var new_dialog = Dialogic.start('StoryIntro')
	add_child(new_dialog)
	yield(get_tree().create_timer(59),"timeout")
	get_tree().change_scene("res://World.tscn")
	
func _process(delta):
	if IntroIsPlayed:
		if Input.is_action_just_pressed("ui_accept"):
			get_tree().change_scene("res://World.tscn")
