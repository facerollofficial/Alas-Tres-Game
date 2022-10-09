tool
extends Area2D

#which scene to transition
export(String, FILE) var next_scene_path = ""
#sets the location of character
export(Vector2) var player_spawn_location = Vector2.ZERO

#check if the next scene is not set
func _get_configuration_warning() ->String:
	if next_scene_path == "":
		return "next_scene_path must be set to make the portal work"
	else:
		return ""

#when character enters the portal(CollisionShape2D)
func _on_Portal_body_entered(body):
	Global.player_initial_map_position = player_spawn_location
	if body.name == 'Player':
		if get_tree().change_scene(next_scene_path) != OK:
			#error handling
			print("Error: Unavailable scene!")
		Global.dia_active = false
