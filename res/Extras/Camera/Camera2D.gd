extends Camera2D

#contains the limits set
onready var topLeft = $Limits/topLeft
onready var bottomRight = $Limits/bottomRight

# Called when the node enters the scene tree for the first time.
func _ready():
	limit_top = topLeft.position.y
	limit_left = topLeft.position.x
	limit_bottom = bottomRight.position.y
	limit_right = bottomRight.position.x
