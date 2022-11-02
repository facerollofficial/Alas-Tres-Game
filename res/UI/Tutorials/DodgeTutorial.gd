extends Control

onready var animation = $AnimationPlayer

func _ready():
	animation.play("SkipButton")
