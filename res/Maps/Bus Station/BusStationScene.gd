extends Node2D

var transDone = false
onready var move_tutorial = $CanvasLayer/MoveTutorial
var tutorial_visible = false

func _ready():
	#to avoid covering the screen
	move_tutorial.visible = false
	
	#trigger monologue
	$AnimationPlayer.play("fade+to_bus")
	transDone = true
	startDialogue()
	
func startDialogue():
	if transDone == true:
		OutsideHouseMusicController.day_scene()
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
	moveTutorial()

func moveTutorial():
	move_tutorial.visible = true
	tutorial_visible = true
	
#to close the tutorial
func _input(event):
	if event.is_action_pressed("close") and tutorial_visible:
		print("closed")
		move_tutorial.visible = false
