extends Area2D

var active = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Player/mark.visible = false
	connect("body_entered",self, 'area_entered')

func area_entered(body):
	if body.name == 'Player':
		if Global.minNum <1:
			$Player/mark.visible = true
			get_tree().paused = true
			var dialog = Dialogic.start('hallwayMonologue')
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect('timeline_end',self,'unpause')
			add_child(dialog)
		Global.minNum +=1

#unpause function
func unpause(timeline_name):
	get_tree().paused = false
	$Player/mark.visible = false
	get_node("CollisionShape2D").disabled= true
