extends CanvasLayer
#signal transitioned

export(String, FILE) var next_scene = ""

func transition():
	$AnimationPlayer.play("fade_text")
	
func _on_AnimationPlayer_animation_finished(anim_name):
	#if anim_name == "fade_to_normal":
		#emit_signal("transitioned")
		OutsideHouseMusicController.end_home_day_scene()
		get_tree().change_scene(next_scene)
