extends Area2D
var stats = PlayerStats
onready var animplayer = $AnimationPlayer

func _on_OreganoHeal_area_entered(_area):
	PlayerStats.oreganoHeal += 1
	animplayer.play("Pickup")

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
