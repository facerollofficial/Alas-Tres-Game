extends Control

func _on_NewGame_pressed():
	print(PlayerStats.max_health)
	get_tree().change_scene("res://Maps/Bus Station/BusStationScene.tscn")
