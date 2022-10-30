extends Node

export(PackedScene) var autosave_scene: PackedScene

const player = preload("res://Player/Player.tscn")

var game_data: Dictionary
var player_x = -808
var player_y = -513
var player_stat = PlayerStats.health
var player_asin = PlayerStats.asinAmmo
var player_bawang = PlayerStats.bawangAmmo
var player_heal = PlayerStats.oreganoHeal
var scene_path = PlayerStats.pathScene

#change data before actual save
func update_data():
	game_data = {'player_data':
			{
				#"pos": player_position,
				"stat": player_stat,
				"posx": player_x,
				"posy": player_y,
				"asin": player_asin,
				"bawang": player_bawang,
				"heal": player_heal,
				"scene": scene_path
			}
		}
	
#save function
func do_save():
	update_data()
	var file: File = File.new()
	file.open("res://saved_game/game.dat",File.WRITE)
	file.store_line(to_json(game_data))
	file.close()
	print("saved data")

#func scene_change():
#	var file: File = File.new()
#	if(file.file_exists("res://saved_game/game.dat")):
#		file.open("res://saved_game/game.dat",File.READ)
#		game_data = parse_json(file.get_as_text())
#		file.close()
		
		#load the json file
#		var player_data = game_data["player_data"]
		
		#get path
#		var path = player_data["scene"]
		#change scene 
#		get_tree().change_scene(path)
	
#load past
func load_data():
	var file: File = File.new()
	file.open("res://saved_game/game.dat",File.READ)
	game_data = parse_json(file.get_as_text())
	file.close()
		
	#load the json file
	var player_data = game_data["player_data"]
		
	#get_tree().reload_current_scene()
	#get path
	var path = player_data["scene"]
	#change scene 
	get_tree().change_scene(path)
	
	#load player data
	player_x = player_data["posx"]
	print(player_x)
	player_y = player_data["posy"]
	print(player_y)
	PlayerStats.health = player_data["stat"] #load last saved health
	PlayerStats.asinAmmo = player_data["asin"]
	PlayerStats.bawangAmmo = player_data["bawang"]
	PlayerStats.oreganoHeal = player_data["heal"]
	print("load")
	
#load
func do_load() -> bool:
	var file: File = File.new()
	if(file.file_exists("res://saved_game/game.dat")):
		file.open("res://saved_game/game.dat",File.READ)
		game_data = parse_json(file.get_as_text())
		file.close()
		
		#load the json file
		var player_data = game_data["player_data"]
		
		#load player data
		get_tree().reload_current_scene()
		player_x = player_data["posx"]
		player_y = player_data["posy"]
		PlayerStats.health = player_data["stat"] #load last saved health
		PlayerStats.asinAmmo = player_data["asin"]
		PlayerStats.bawangAmmo = player_data["bawang"]
		PlayerStats.oreganoHeal = player_data["heal"]
		PlayerStats.pathScene = player_data["scene"]
		print("loaded")
		
		return true
	else:
		return false
