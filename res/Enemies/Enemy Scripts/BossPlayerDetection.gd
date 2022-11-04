extends Area2D

var player = null

func can_see_player():
	return player != null

func _on_PlayerDetectionZone_body_entered(body):
	player = body
	
	print("Enemies Detected You: " + str(MusicController.enemiesDetected))


func _on_PlayerDetectionZone_body_exited(_body):
	player = null
	MusicController.boss_fight_music_off()
	print("Enemies Detected You: " + str(MusicController.enemiesDetected))
