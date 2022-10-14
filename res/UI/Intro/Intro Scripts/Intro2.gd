extends Node2D

var IsPlayed = false
func _ready():
	$AnimationPlayer.play("StoryIntro")
	var new_dialog = Dialogic.start('StoryIntro')
	add_child(new_dialog)
	yield(get_tree().create_timer(59),"timeout")
	IsPlayed = true

func _process(delta):
	if IsPlayed == true:
		$TransitionScene.transition()
