extends Node2D

onready var interact_tutorial = $CanvasLayer/InteractTutorial
var tutorial_visible = false

# Called when the node enters the scene tree for the first time.
func _ready():
	interact_tutorial.visible = false
	interactTutorial()

func interactTutorial():
	get_tree().paused = true
	#yield(get_tree().create_timer(1.5), "timeout")
	interact_tutorial.visible = true
	tutorial_visible = true
	unpause()
	
func unpause():
	get_tree().paused = false
	
#to close the tutorial
func _input(event):
	if event.is_action_pressed("close") and tutorial_visible:
		print("closed")
		interact_tutorial.visible = false
