extends Area2D

var transDone = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("fade_in")
	transDone = true
	startDialogue()

#function for the monologue
func startDialogue():
	if transDone == true:
		yield(get_tree().create_timer(1), "timeout")
		print(Global.dia_active)
		print(Global.IsPlayed)
		if Global.IsPlayed == true:
			get_tree().paused = true
			var dialog = Dialogic.start('roomMonologue')
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect('timeline_end',self,'unpause')
			add_child(dialog)

#unpause function
func unpause(timeline_name):
	get_tree().paused = false
	get_node("CollisionShape2D").disabled= true
