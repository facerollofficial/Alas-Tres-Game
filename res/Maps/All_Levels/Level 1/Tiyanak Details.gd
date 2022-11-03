extends Area2D

onready var tiyanak_details = $CanvasLayer/EnemyTiyanakInfo

# Called when the node enters the scene tree for the first time.
func _ready():
	tiyanak_details.visible = false

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		get_tree().paused = true
		tiyanak_details.visible = true
		unpause()

func unpause():
	print("unpause")
	get_tree().paused = false

func _input(event):
	if event.is_action_pressed("resume"):
		print("tyanak info")
		tiyanak_details.visible = false
		$CollisionShape2D.disabled = true
