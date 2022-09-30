extends Node2D

func _ready():
	
	#$AnimationPlayer.play("SponsorIntro")
	#yield(get_tree().create_timer(8),"timeout")
	$AnimationPlayer.play("StoryIntro")
	var new_dialog = Dialogic.start('StoryIntro')
	add_child(new_dialog)
	yield(get_tree().create_timer(59),"timeout")
	
	get_tree().change_scene("res://World.tscn")
