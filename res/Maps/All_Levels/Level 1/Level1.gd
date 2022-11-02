extends Node2D

var anim_done = false
var tutorial_visible = false
onready var attack_tutorial = $CanvasLayer/AttackTutorial
onready var saving_tutorial = $CanvasLayer/SavingTutorial

func _ready():
	#to avoid clash with options
	$YSort/Stranger.visible = false
	$YSort/StrangerAttack.visible = false
	$CanvasLayer/ColorRect.visible = false
	$TikbalangCutscene/Camera2D.current = true
	$TikbalangCutscene/Camera2D2.current = false
	
	#to avoid covering the screen
	attack_tutorial.visible = false
	saving_tutorial.visible = false
	
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
	#dialog.connect('timeline_end',self,'unpause')
	dialog.connect('timeline_end',self,'tutorial')

#tutorial function
func tutorial(timeline_name):
	print("tutorial visible")
	#tutorial weapon
	get_tree().paused = false
	attack_tutorial.visible = true
	$CanvasLayer/ColorRect.visible = false
	tutorial_visible = true

#to close the tutorial
func _input(event):
	if event.is_action_pressed("next") and tutorial_visible:
		print("proceed na")
		attack_tutorial.visible = false
		saving_tutorial.visible = true

	if event.is_action_pressed("close") and tutorial_visible:
		print("closed")
		saving_tutorial.visible = false
		tutorial_visible = false
