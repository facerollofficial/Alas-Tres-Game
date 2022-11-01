extends Node2D

var anim_done = false
onready var attack_tutorial = $CanvasLayer/AttackTutorial

func _ready():
	#to avoid clash with options
	$YSort/Stranger.visible = false
	$YSort/StrangerAttack.visible = false
	$CanvasLayer/ColorRect.visible = false
	
	#to avoid covering the screen
	attack_tutorial.visible = false
	
	#loading and saving
	var file: File = File.new()
	if(file.file_exists("res://saved_game/game.dat")):
		pass
	else:
		PlayerStats.pathScene = "res://Maps/All_Levels/Level 1/Level1.tscn"
		GameManager.do_save()
		
		#cutscene
		$CanvasLayer/ColorRect.visible = true
		$CanvasLayer/AnimationPlayer.play("white_to_fade")
		$YSort/Stranger.visible = true
		$YSort/StrangerAttack.visible = true
		
		yield(get_tree().create_timer(3), "timeout")
		#start dialogue with stranger
		get_tree().paused = true
		var dialog = Dialogic.start('timeline-stranger')
		dialog.pause_mode = Node.PAUSE_MODE_PROCESS
		add_child(dialog)
		dialog.connect('timeline_end',self,'dialogueDone')
		dialog.connect('dialogic_signal',self,'dialogic_signal')

func dialogueDone(timeline_name):
	pass

#signal function for choices
func dialogic_signal(argument):
	print("here")
	if argument == "user_accepted":
		print("yaaas")
		#flashing screen
		$YSort/Stranger.visible = false
		$YSort/StrangerAttack.visible = false
		$CanvasLayer/AnimationPlayer.play("flash")
		anim_done = true
		aghoyEnter()
	elif argument == "user_declined":
		print("naur")
		#attack player
		$CanvasLayer/AnimationPlayer.play("attack")
		#aghoy warn
		yield(get_tree().create_timer(0.7), "timeout")
		var dialog = Dialogic.start('timeline-aghoy_warn')
		dialog.pause_mode = Node.PAUSE_MODE_PROCESS
		add_child(dialog)
		dialog.connect('timeline_end',self,'flash')

func flash(timeline_name):
	#flashing screen
	$YSort/Stranger.visible = false
	$YSort/StrangerAttack.visible = false
	$CanvasLayer/AnimationPlayer.play("flash")
	anim_done = true
	aghoyEnter()
	
func aghoyEnter():
	yield(get_tree().create_timer(1), "timeout")
	#dialog with aghoy
	var dialog = Dialogic.start('timeline-after_encounter')
	dialog.pause_mode = Node.PAUSE_MODE_PROCESS
	add_child(dialog)
	dialog.connect('timeline_end',self,'unpause')

func unpause(timeline_name):
	print("unpause")
	get_tree().paused = false
	$CanvasLayer/ColorRect.visible = false
	
#func move_to_tutorial(timeline_name):
#	tutorial()

#tutorial function
#func tutorial():
	#tutorial weapon
#	attack_tutorial.visible = true

#func _input(event):
#	if event.is_action_pressed("trigger_convo"):
#		print("closed")
#		attack_tutorial.visible = false
#	print("unpause")
#	get_tree().paused = false
##	$CanvasLayer/ColorRect.visible = false
