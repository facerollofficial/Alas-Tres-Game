extends Area2D
var stats = PlayerStats
onready var animplayer = $AnimationPlayer
signal playerpickedup

func _on_BawangPickup_area_entered(area):
	stats.bawangAmmo += 1
	animplayer.play("Pickup")

func _on_AnimationPlayer_animation_finished(anim_name):
	self.queue_free()
