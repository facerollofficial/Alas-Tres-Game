extends KinematicBody2D

const ACCELERATION = 500
const MAX_SPEED = 80
const FRICTION = 500

var velocity = Vector2.ZERO

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	if input_vector != Vector2.ZERO:
		if input_vector.y > 0:
			$AnimatedSprite.play("down")
		elif input_vector.y <0:
			$AnimatedSprite.play("up")
		else:
			if input_vector.x > 0:
				$AnimatedSprite.flip_h = false
				$AnimatedSprite.play("right")
			elif input_vector.x < 0:
				$AnimatedSprite.flip_h = true
				$AnimatedSprite.play("right")
		
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		$AnimatedSprite.stop()
		$AnimatedSprite.frame = 0
	
	velocity = move_and_slide(velocity)
