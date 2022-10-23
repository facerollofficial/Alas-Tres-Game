extends KinematicBody2D

const EnemyDeathEffect = preload("res://Effects/Combat/EnemyDeathEffect.tscn")

export var ACCELERATION = 300
export var MAX_SPEED = 50
export var FRICTION = 200
export var WANDER_TARGET_RANGE = 4

var velocity = Vector2.ZERO
var knockback = Vector2.ZERO

var state = CHASE

enum {
	IDLE,
	WANDER,
	CHASE,
	CHARGE,
	ATTACK
}

## ONREADY VARIABLES ##
onready var stats = $Stats
onready var playerDetectionZone = $PlayerDetectionZone
onready var attackZone = $AttackZone
onready var hurtbox = $Hurtbox
onready var softCollision = $SoftCollision
onready var wanderController = $WanderController
onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var blinkAnimationPlayer = $BlinkAnimationPlayer
onready var animationState = animationTree.get("parameters/playback")

func _ready():
	randomize()
	animationTree.active = true

func _physics_process(delta):
	knockback = knockback.move_toward(Vector2.ZERO, FRICTION * delta)
	knockback = move_and_slide(knockback)
	
	match state:
		IDLE:
			animationState.travel("Idle")
			velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
			seek_player()
			change_to_attack()
			
			if wanderController.get_time_left() == 0:
				update_wander()
		WANDER:
			seek_player()
			change_to_attack()
			if wanderController.get_time_left() == 0:
				update_wander()
			accelerate_towards_point(wanderController.target_position, delta)
			if global_position.distance_to(wanderController.target_position) <= MAX_SPEED * delta:
				update_wander()
		CHASE:
			change_to_attack()
			var player = playerDetectionZone.player
			var _target = attackZone.player
			if player != null:
					accelerate_towards_point(player.global_position, delta) 
			else:
				state = IDLE
		CHARGE:
			velocity = Vector2.ZERO
			animationState.travel("Charging")
			
		ATTACK:
			velocity = Vector2.ZERO
			animationState.travel("Attack")

	if softCollision.is_colliding():
			velocity += softCollision.get_push_vector() * delta * 250
	velocity = move_and_slide(velocity)

func attack_animation_finished():
	animationState.travel("Charging")
	if attackZone.target_within_attack_zone():
		state = CHARGE
	else:
		state = CHASE

func seek_player():
	if playerDetectionZone.can_see_player():
		state = CHASE

func change_to_attack():
	if attackZone.target_within_attack_zone():
		state = CHARGE

## UPDATE WANDER ##
func update_wander():
	state = pick_random_state([IDLE, WANDER])
	wanderController.start_wander_timer(rand_range(1,3))

## PICK A RANDOM STATE ##
func pick_random_state(state_list):
	state_list.shuffle()
	return state_list.pop_front()

## CHASE DETECTED PLAYER ##
func accelerate_towards_point(point, delta):
	var direction = global_position.direction_to(point)
	velocity = velocity.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
	
	
	animationTree.set("parameters/Idle/blend_position", direction)
	animationTree.set("parameters/Charging/blend_position", direction)
	animationTree.set("parameters/Attack/blend_position", direction)
	animationTree.set("parameters/Run/blend_position", direction)
	animationState.travel("Run")

func _on_Hurtbox_invincibility_ended():
	blinkAnimationPlayer.play("Stop")


func _on_Hurtbox_invincibility_started():
	blinkAnimationPlayer.play("Start")


func _on_Stats_no_health():
	queue_free()
	var enemyDeathEffect = EnemyDeathEffect.instance()
	get_parent().add_child(enemyDeathEffect)
	enemyDeathEffect.global_position = global_position


func _on_Hurtbox_area_entered(area):
	stats.health -= area.damage
	knockback = area.knockback_vector * 50
	hurtbox.create_hit_effect()
	hurtbox.start_invincibility(0.4)

func doneCharging():
	state = ATTACK
	print("Hello World")
