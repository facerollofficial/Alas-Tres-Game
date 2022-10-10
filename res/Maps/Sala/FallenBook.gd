extends Area2D

var dissolvePlayed = false

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered",self, '_on_Book_body_entered')
		
#trigger dialogue when reached the book area
func _on_Book_body_entered(body):
	if body.name == 'Player':
		get_tree().paused = true
		var dialog = Dialogic.start('fallenBookMonologue')
		dialog.pause_mode = Node.PAUSE_MODE_PROCESS
		dialog.connect('timeline_end',self,'unpause')
		add_child(dialog)

#unpause function
func unpause(timeline_name):
	get_tree().paused = false
	flash()

func flash():
	var a = 0
	while a<1:
		a+=0.04
		$YSort/Player/Sprite.material.set_shader_param("progress",a)
		yield(get_tree().create_timer(0.03), "timeout") #delay to make the dissolve effect visible
	dissolvePlayed = true
	
func _process(delta):
	if dissolvePlayed == true:
		$YSort/TransitionScene.transition()
