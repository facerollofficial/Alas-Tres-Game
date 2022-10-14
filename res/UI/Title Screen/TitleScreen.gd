extends Control

func _on_NewGame_pressed():
	print(PlayerStats.max_health)
	#play intro
	get_tree().change_scene("res://UI/Intro/Intro Scripts/Intro2.tscn")
	#transition to bus station
	#get_tree().change_scene("res://Maps/Bus Station/BusStationScene.tscn")
