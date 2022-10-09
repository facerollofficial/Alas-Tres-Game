extends CanvasLayer
signal transitioned

func transition():
	$AnimationPlayer.play("fade_to_white")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_to_white":
		emit_signal("transitioned")
		$AnimationPlayer.play("fade_to_normal")
		get_tree().change_scene("res://Maps/Forest/ForestNormal.tscn")
