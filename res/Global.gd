#GDSCript accessible by all parts of this file
extends Node

enum ItemRarity{
	NORMAL = 0,
	MAGIC,
	RARE,
	LEGENDARY
}

var player_initial_map_position = Vector2(197,115) #sets the initial position of character
var player_facing_direction = 1
#if true means dialogue will appear else dialogue will not appear
var dia_active = true
#incremented when hallway dialogue is done, this is used so that hallway dialogue will not repeat
var minNum: int = 0 

var screen_width: int=ProjectSettings.get_setting("display/window/size/width")
var screen_height: int=ProjectSettings.get_setting("display/window/size/height")
var scree_dimensions: Vector2 = Vector2(screen_width,screen_height)
