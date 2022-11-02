extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer/ColorRect.visible = false
	$CanvasLayer/Sprite.visible = false

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		get_tree().paused = true
		$CanvasLayer/ColorRect.visible = true
		$CanvasLayer/Sprite.visible = true
		$AnimationPlayer.play("tiyanak_details")
		yield(get_tree().create_timer(20.6), "timeout")
		unpause()
	
func unpause():
	print("done")
	$CanvasLayer/ColorRect.visible = false
	$CanvasLayer/Sprite.visible = false
	get_tree().paused = false
