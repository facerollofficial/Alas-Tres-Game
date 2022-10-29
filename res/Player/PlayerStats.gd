extends Node

#config:
var music_bus = AudioServer.get_bus_index("Music")
var music_volume = -18
var sfx_volume = -18

export(int) var max_health = 4 setget set_max_health
var health = max_health setget set_health

export(int) var positionx = -808 setget set_x_pos
export(int) var positiony = -513 setget set_y_pos

var asinAmmo = 0 setget set_asin
var bawangAmmo = 0 setget set_bawang
var oreganoHeal = 0 setget set_oregano


signal no_health
signal health_changed(value)
signal max_health_changed(value)
signal xposchanged(value)
signal yposchanged(value)
signal asin_ammo_changed(value)
signal bawang_ammo_changed(value)
signal oregano_changed(value)

func set_asin(value):
	asinAmmo = value
	emit_signal("asin_ammo_changed", value)

func set_bawang(value):
	bawangAmmo = value
	emit_signal("bawang_ammo_changed", value)

func set_oregano(value):
	oreganoHeal = value
	emit_signal("oregano_changed", value)

func set_x_pos(value):
	print("xpos: ",value)
	emit_signal("xposchanged",value)
	
func set_y_pos(value):
	print("ypos: ",value)
	emit_signal("yposchanged",value)

func set_max_health(value):
	max_health = value
	self.health = min(health, max_health)
	emit_signal("max_health_changed", max_health)
	
func set_health(value):
	health = value
	emit_signal("health_changed", health)
	if health <= 0:
		emit_signal("no_health")
		
func _ready():
	self.health = max_health
