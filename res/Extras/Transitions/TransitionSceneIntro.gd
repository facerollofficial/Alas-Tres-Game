extends CanvasLayer
#signal transitioned

export(String, FILE) var next_scene = ""

func transition():
	$AnimationPlayer.play("fade_to_normal")
	
func _on_AnimationPlayer_animation_finished(anim_name):
	#if anim_name == "fade_to_normal":
		#emit_signal("transitioned")
		get_tree().change_scene(next_scene)
