extends Control

onready var animation = $AnimationPlayer
onready var lightanimation = $LightFlicker

func _ready():
	animation.play("SkipButton")
	lightanimation.play("flickerlight")

