extends Area2D

var stats = PlayerStats
onready var animplayer = $AnimationPlayer

func _on_AsinPickup_area_entered(area):
	PlayerStats.asinAmmo += 1
	animplayer.play("Pickup")

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
