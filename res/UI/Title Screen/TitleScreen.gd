tool
extends Control

onready var optionMenu = $GUI/Options
onready var confirmMsg = $GUI/Confirm

func _ready():
	optionMenu.visible = false
	var file: File = File.new()
	if(file.file_exists("res://saved_game/game.dat")):
		$Menu/HBoxContainer2/VBoxContainer2/Continue.disabled = false
	else:
		$Menu/HBoxContainer2/VBoxContainer2/Continue.disabled = true

func _on_NewGame_pressed():
	print(PlayerStats.max_health)
	var file: File = File.new()
	if(file.file_exists("res://saved_game/game.dat")):
		confirmMsg.visible = true
	else:
		#play intro
		get_tree().change_scene("res://UI/Intro/Intro Scripts/Intro2.tscn")

func _on_Options_pressed():
	optionMenu.visible = true

func _on_Back_pressed():
	optionMenu.visible = false

func _on_Continue_pressed():
	GameManager.load_data()
	
func _on_Quit_pressed():
	get_tree().quit()

func _on_Yes_pressed():
	GameManager.delete_data()
	
func _on_No_pressed():
	confirmMsg.visible = false
