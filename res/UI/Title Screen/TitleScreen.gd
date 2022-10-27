extends Control

onready var optionMenu = $GUI/Options

func _ready():
	optionMenu.visible = false

func _on_NewGame_pressed():
	print(PlayerStats.max_health)
	#play intro
	get_tree().change_scene("res://UI/Intro/Intro Scripts/Intro2.tscn")
	#transition to bus station
	#get_tree().change_scene("res://Maps/Bus Station/BusStationScene.tscn")

func _on_Options_pressed():
	optionMenu.visible = true

func _on_Back_pressed():
	optionMenu.visible = false

func _on_Quit_pressed():
	get_tree().quit()
