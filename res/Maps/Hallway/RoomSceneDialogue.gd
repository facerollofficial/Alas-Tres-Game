extends Area2D

var active = false

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered",self,'area_entered')

#function for the monologue
func area_entered(body):
	if body.name == 'Player':
		if Global.dia_active != false:
			get_tree().paused = true
			var dialog = Dialogic.start('roomMonologue')
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS
			dialog.connect('timeline_end',self,'unpause')
			add_child(dialog)
		
#unpause function
func unpause(timeline_name):
	get_tree().paused = false
	get_node("CollisionShape2D").disabled= true
