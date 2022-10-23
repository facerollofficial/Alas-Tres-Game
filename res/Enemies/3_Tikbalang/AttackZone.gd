extends Area2D

var player = null

func target_within_attack_zone():
	return player != null

func _on_AttackZone_body_entered(body):
	player = body

func _on_AttackZone_body_exited(_body):
	player = null
