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
		#mc room position
		Global.player_initial_map_position = Vector2(197,115)
		#sala day position
		Global.player_initial_map_position2 = Vector2(120,115)
		#hallway night fallen book
		Global.minNum = 0
		#level 1
		GameManager.player_x = -808
		GameManager.player_y = -513
		PlayerStats.health = 4
		PlayerStats.asinAmmo = 0
		PlayerStats.bawangAmmo = 0
		PlayerStats.oreganoHeal = 0
		PlayerStats.pathScene = ""
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
