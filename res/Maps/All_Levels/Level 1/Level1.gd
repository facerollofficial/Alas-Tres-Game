extends Node2D

var anim_done = false
var tutorial_visible = false
var ctr = 1
onready var attack_tutorial = $CanvasLayer/AttackTutorial
onready var dodge_tutorial = $CanvasLayer/DodgeTutorial
onready var pickup_tutorial = $CanvasLayer/PickupsTutorial
onready var pickup_oregano = $CanvasLayer/PickupOreganoTutorial
onready var saving_tutorial = $CanvasLayer/SavingTutorial
onready var pause_tutorial = $CanvasLayer/PauseTutorial

func _ready():
	#to avoid clash with options
	$YSort/Stranger.visible = false
	$YSort/StrangerAttack.visible = false
	$CanvasLayer/ColorRect.visible = false
	$TikbalangCutscene/Camera2D.current = true
	$TikbalangCutscene/Camera2D2.current = false
	$CanvasLayer/ColorRect2.visible = false
	PlayerStats.health = 4
	
	#to avoid covering the screen
	attack_tutorial.visible = false
	dodge_tutorial.visible = false
	pickup_tutorial.visible = false
	pickup_oregano.visible = false
	saving_tutorial.visible = false
	pause_tutorial.visible = false
	
	#loading and saving
	var file: File = File.new()
	if(file.file_exists("res://saved_game/game.dat")):
		PlayerStats.pathScene = "res://Maps/All_Levels/Level 1/Level1.tscn"
		#black fade
		$CanvasLayer/ColorRect2.visible = true
		MusicController.play_dark_ambience()
		MusicController.play_level1_bgm()
		$CanvasLayer/AnimationPlayer.play("black_to_fade")
		yield(get_tree().create_timer(2), "timeout")
		$CanvasLayer/ColorRect2.visible = false
	else:
		PlayerStats.pathScene = "res://Maps/All_Levels/Level 1/Level1.tscn"
		GameManager.do_save()
		
		#cutscene
		$CanvasLayer/ColorRect.visible = true
		$CanvasLayer/AnimationPlayer.play("white_to_fade")
		$YSort/Stranger.visible = true
		$YSort/StrangerAttack.visible = true
		
		yield(get_tree().create_timer(3), "timeout")
		#$MusicController.play_level1_bgm()
		#$MusicController.play_dark_ambience()
		MusicController.play_dark_ambience()
		MusicController.play_level1_bgm()
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
	if event.is_action_pressed("next") and ctr == 1:
		print("tut1")
		attack_tutorial.visible = false
		dodge_tutorial.visible = true
		ctr+=1
	elif event.is_action_pressed("next") and ctr == 2:
		print("tut",ctr)
		dodge_tutorial.visible = false
		pickup_tutorial.visible = true
		ctr+=1
	elif event.is_action_pressed("next") and ctr == 3:
		print("tut",ctr)
		pickup_tutorial.visible = false
		pickup_oregano.visible = true
		ctr+=1
	elif event.is_action_pressed("next") and ctr == 4:
		print("tut",ctr)
		pickup_oregano.visible = false
		saving_tutorial.visible = true
		ctr+=1
	elif event.is_action_pressed("next") and ctr == 5:
		print("tut",ctr)
		saving_tutorial.visible = false
		pause_tutorial.visible = true
		ctr+=1

	if event.is_action_pressed("close") and tutorial_visible:
		print("closed")
		attack_tutorial.visible = false
		dodge_tutorial.visible = false
		pickup_tutorial.visible = false
		pickup_oregano.visible = false
		saving_tutorial.visible = false
		pause_tutorial.visible = false
