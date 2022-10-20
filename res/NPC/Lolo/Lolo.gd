extends Area2D

var active = false
var text = 'timeline-1'
var sceneDone = false

export(float) var speed = 100
var move = 0
var target = Vector2(18,-7)

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered",self, '_on_NPC_body_entered')
	connect("body_exited",self, '_on_NPC_body_exited')

#function for the mark if the player is inside the area the mark will show up
func _process(delta):
	$mark.visible = active
	if sceneDone == true:
		$TransitionSalaToRoom.transition()

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
	$AnimationPlayer.play("walk")
	yield(get_tree().create_timer(2.5), "timeout")
	$AnimationPlayer.play("fade_out")
	yield(get_tree().create_timer(3), "timeout")
	$AnimationPlayer.play("start_point")
	yield(get_tree().create_timer(0.1), "timeout")
	$AnimationPlayer.play("fade_in")
	var cam = get_node("/root/Node2D/YSort/Player/RemoteTransform2D")
	var oldChar = get_node("/root/Node2D/YSort/Player")
	var newChar = get_node("/root/Node2D/YSort/Lolo")
	oldChar.remove_child(cam)
	newChar.add_child(cam)
	yield(get_tree().create_timer(3), "timeout")
	$AnimationPlayer.play("walk_back")
	var dialog = Dialogic.start("timeline-2")
	dialog.connect('timeline_end',self,'next_scene')
	add_child(dialog)
	
func next_scene(timeline_name):
	sceneDone = true
	
#checks if the player is inside the area set for lolo or not; used for the mark if it will show up or not
func _on_NPC_body_entered(body):
	if body.name == 'Player':
		active = true

func _on_NPC_body_exited(body):
	if body.name == 'Player':
		active = false

func change_timeline(timeline):
	text = timeline
