extends Node2D

var transDone = false
func _ready():
	$AnimationPlayer.play("fade+to_bus")
	transDone = true
	startDialogue()
	
func startDialogue():
	if transDone == true:
		yield(get_tree().create_timer(1), "timeout")
		if Global.IsPlayed == false:
			#print the dialogue created in dialogic
			get_tree().paused = true
			var dialog = Dialogic.start("OutsideMonologue")
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect('timeline_end',self,'unpause')
			add_child(dialog)
			Global.IsPlayed = true #used to make sure that the dialogue will only appear once

#unpause function
func unpause(timeline_name):
	get_tree().paused = false
