extends Control

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _on_ReturnToMain_pressed():
	MusicController.end_sound()
	get_tree().change_scene("res://UI/Title Screen/TitleScreen.tscn")
	#delete data to disable continue button
	var dir = Directory.new()
	dir.remove("res://saved_game/game.dat")
