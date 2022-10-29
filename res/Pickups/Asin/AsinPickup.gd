extends Area2D

var stats = PlayerStats

func _on_AsinPickup_area_entered(area):
	stats.asinAmmo += 1
	self.queue_free()
