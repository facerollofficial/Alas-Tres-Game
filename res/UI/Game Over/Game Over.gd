extends Control

func _ready():
	PlayerStats.connect("no_health", self, "game_over")

func game_over():
	self.visible = true
	

func _on_Quit_to_Title_pressed():
	MusicController.end_sound()
	get_tree().change_scene("res://UI/Title Screen/TitleScreen.tscn")

func _on_LoadLastSave_pressed():
	self.visible = false
	GameManager.do_load()
