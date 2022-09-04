extends Node2D

func _ready():
	
	$AnimationPlayer.play("fade in")
	yield(get_tree().create_timer(4), "timeout")
	$AnimationPlayer.play("fade out")
	yield(get_tree().create_timer(2),"timeout")
	get_tree().change_scene("res://World.tscn")
