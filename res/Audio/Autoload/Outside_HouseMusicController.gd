extends Node

onready var forest_ambiance = $Forest_Ambiance
onready var home_sweet_home = $Home_Sweet_Home
onready var home_night_ambiance = $Home_Night_Ambiance

func _ready():
	pass

#day scenes
func day_scene():
	forest_ambiance.playing = true
	home_sweet_home.playing = true
	
func home_day_scene():
	forest_ambiance.playing = false
	
func end_home_day_scene():
	home_sweet_home.playing = false
	
#night scenes
func night_scene():
	home_night_ambiance.playing = true

func end_night_scene():
	home_night_ambiance.playing = false
