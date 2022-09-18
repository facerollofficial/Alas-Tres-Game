extends Node2D

onready var animatedSprite = $GrassAnimSprite

func _ready():
	animatedSprite.frame = 0
	animatedSprite.play("animate")


func _on_GrassAnimSprite_animation_finished():
	queue_free()
