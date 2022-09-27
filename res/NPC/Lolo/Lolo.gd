extends Area2D

var active = false
var text = 'timeline-1'
# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered",self, '_on_NPC_body_entered')
	connect("body_exited",self, '_on_NPC_body_exited')

#function for the mark if the player is inside the area the mark will show up
func _process(delta):
	$mark.visible = active

#function for the dialogue 1; trigger_convo: use left key mouse to start convo
func _input(event):
	if get_node_or_null('DialogNode') == null:
		if event.is_action_pressed("trigger_convo") and active:
			get_tree().paused = true #allows the player not to move when convo is on going
			var dialog = Dialogic.start(text)
			dialog.pause_mode = Node.PAUSE_MODE_PROCESS 
			dialog.connect('timeline_end',self,'unpause')
			add_child(dialog)

#unpause the player once conversation is done
func unpause(timeline_name):
	get_tree().paused = false

#checks if the player is inside the area set for lolo or not; used for the mark if it will show up or not
func _on_NPC_body_entered(body):
	if body.name == 'Player':
		active = true

func _on_NPC_body_exited(body):
	if body.name == 'Player':
		active = false

func change_timeline(timeline):
	text = timeline
