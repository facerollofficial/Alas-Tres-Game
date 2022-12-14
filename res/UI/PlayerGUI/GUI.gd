extends CanvasLayer
var is_paused = false setget set_is_paused

onready var optionsScreen = $Options
onready var pauseScreen = $Pause
onready var gameOverScreen = $GameOver
onready var kitUI = $KitUI
onready var quitConfirm = $QuitConfirm
onready var catalogUI = $CatalogueUI
onready var artLabel = $CatalogueUI/ArtLabel
onready var catalogBtn = $CatalogueButton

func _ready():
	optionsScreen.visible = false
	gameOverScreen.visible = false
	quitConfirm.visible = false
	catalogUI.visible = false

func _unhandled_input(event):
	if gameOverScreen.visible!=true:
		if event.is_action_pressed("Pause"):
			#MusicController.end_sound()
			self.is_paused = !is_paused
	if catalogUI.visible != true:
		if event.is_action_pressed("resume"):
			catalogBtn.visible = true

func set_is_paused(value):
	if quitConfirm.visible == true:
		quitConfirm.visible = false
	elif optionsScreen.visible == true:
		optionsScreen.visible = false
	else:
		is_paused = value    
		MusicController.end_sound()
		get_tree().paused = is_paused
		pauseScreen.visible = is_paused
		optionsScreen.visible = false
		kitUI.visible = !is_paused

func _on_Options_pressed():
	optionsScreen.visible = true

func _on_Back_pressed():
	optionsScreen.visible = false

func _on_Quit_pressed():
	quitConfirm.visible = true

func _on_Yes_pressed():
	self.is_paused = false
	get_tree().paused = false
	MusicController.end_sound()
	get_tree().change_scene("res://UI/Title Screen/TitleScreen.tscn")

func _on_No_pressed():
	quitConfirm.visible = false

func _on_Resume_pressed():
	MusicController.play_level1_bgm()
	MusicController.play_dark_ambience()
	self.is_paused = false

func _on_CatalogueButton_pressed():
	if is_paused != true:
		if catalogUI.visible!=true:
			catalogUI.visible = true
			artLabel.visible = true
			catalogBtn.visible = false
