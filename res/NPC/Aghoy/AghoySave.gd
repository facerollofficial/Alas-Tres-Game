extends Area2D

var active = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#connect("body_entered",self,'_on_Area2D_body_entered')
	#connect("body_entered",self,'_on_Area2D_body_exited')
	
func _process(delta):
	$mark.visible = active
	
func _input(event):
	if event.is_action_pressed("trigger_convo") and active:
		print("zzz")
		get_tree().paused = true
		var dialog = Dialogic.start('timeline-save')
		dialog.pause_mode = Node.PAUSE_MODE_PROCESS
		add_child(dialog)
		dialog.connect('timeline_end',self,'unpause')
		dialog.connect('dialogic_signal',self,'dialogic_signal')
		
			
#unpause function
func unpause(timeline_name):
	get_tree().paused = false
	
#trigger dialogue when reached aghoy area
func _on_Area2D_body_entered(body):
	if body.name == 'Player':
		active = true

#signal function for choices
func dialogic_signal(argument):
	if argument == "user_clicked_yes":
		print("yaaas")
		GameManager.do_save()
	elif argument == "user_clicked_no":
		print("naur")

func _on_Area2D_body_exited(body):
	if body.name == 'Player':
		active = false
