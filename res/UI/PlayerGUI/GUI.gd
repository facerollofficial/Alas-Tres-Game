extends CanvasLayer
var is_paused = false setget set_is_paused

onready var optionsScreen = $Options
onready var pauseScreen = $Pause

func _ready():
	optionsScreen.visible = false

func _unhandled_input(event):
	if event.is_action_pressed("Pause"):
		self.is_paused = !is_paused

func set_is_paused(value):
	is_paused = value
	get_tree().paused = is_paused
	pauseScreen.visible = is_paused
	optionsScreen.visible = false

func _on_Options_pressed():
	optionsScreen.visible = true

func _on_Back_pressed():
	optionsScreen.visible = false

func _on_Quit_pressed():
	self.is_paused = false
	get_tree().change_scene("res://UI/Title Screen/TitleScreen.tscn")

func _on_Resume_pressed():
	self.is_paused = false
