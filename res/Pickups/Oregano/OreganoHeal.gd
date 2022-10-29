extends Area2D
var stats = PlayerStats

signal playerpickedup

func _on_OreganoHeal_area_entered(_area):
	stats.oreganoHeal += 1
	self.queue_free()
