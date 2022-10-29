extends Area2D

var stats = PlayerStats

func _on_BawangPickup_area_entered(area):
	stats.bawangAmmo += 1
	self.queue_free()
