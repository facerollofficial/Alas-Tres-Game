extends Node2D

func _ready():
	var file: File = File.new()
	if(file.file_exists("res://saved_game/game.dat")):
		pass
	else:
		PlayerStats.pathScene = "res://Maps/All_Levels/Level 1/Level1.tscn"
		GameManager.do_save()
