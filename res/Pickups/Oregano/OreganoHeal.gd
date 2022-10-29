extends Area2D
const PickupSound = preload("res://Pickups/PickupSFX.tscn")
var stats = PlayerStats

func _on_OreganoHeal_area_entered(_area):
	stats.oreganoHeal += 1
	self.queue_free()
	var pickupSound = PickupSound.instance()
	get_tree().current_scene.add_child(pickupSound)

