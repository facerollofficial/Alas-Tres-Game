extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer/ColorRect.visible = false
	$CanvasLayer/Sprite.visible = false

func _on_Area2D_body_entered(body):
	if body.name == 'Player':
		#pause to avoid reaching the collision shape while animation is playing
		get_tree().paused = true
		
		#pane camera to tikbalang
		$Camera2D.current = false
		$Camera2D2.current = true
		
		#start animation
		$AnimationPlayer.play("tikbalang_cutscene")
		yield(get_tree().create_timer(1.5), "timeout")
		
		#bring back camera to player
		$Camera2D.current = true
		$Camera2D2.current = false
		creatureDetail()
		
func creatureDetail():
	print("dets")
	$CanvasLayer/ColorRect.visible = true
	$CanvasLayer/Sprite.visible = true
	$AnimationPlayer.play("tikbalang_details")
	yield(get_tree().create_timer(20.6), "timeout")
	unpause()
	
func unpause():
	print("done na")
	$CanvasLayer/ColorRect.visible = false
	$CanvasLayer/Sprite.visible = false
	get_tree().paused = false
