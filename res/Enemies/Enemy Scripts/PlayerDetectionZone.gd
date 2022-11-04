extends Area2D

var player = null

func can_see_player():
	return player != null

func _on_PlayerDetectionZone_body_entered(body):
	player = body
	MusicController.enemiesDetected += 1
	if MusicController.enemiesDetected <= 1:
		MusicController.normal_fight_music_on()
	print("Enemies Detected You: " + str(MusicController.enemiesDetected))


func _on_PlayerDetectionZone_body_exited(_body):
	player = null
	MusicController.enemiesDetected -= 1
	if MusicController.enemiesDetected == 0:
		MusicController.normal_fight_music_off()
	print("Enemies Detected You: " + str(MusicController.enemiesDetected))
