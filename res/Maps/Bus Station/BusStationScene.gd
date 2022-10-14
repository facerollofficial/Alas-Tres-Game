extends Node2D

var transDone = false
func _ready():
	$AnimationPlayer.play("fade+to_bus")
	transDone = true
	startDialogue()
	
func startDialogue():
	if transDone == true:
		if Global.IsPlayed == false:
			#print the dialogue created in dialogic
			var dialog = Dialogic.start("OutsideMonologue")
			add_child(dialog)
			Global.IsPlayed = true #used to make sure that the dialogue will only appear once
