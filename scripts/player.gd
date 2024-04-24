extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -600.0
const FRICTION = 0.03

var up_key : StringName
var left_key : StringName
var right_key : StringName

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func setup(up : StringName, left : StringName, right : StringName):
	up_key = up
	left_key = left
	right_key = right

func player_controls(up, left, right, delta):
		# Handle jump, the longer you press the shorter the jump.
	if Input.is_action_just_pressed(up) and is_on_floor():
		velocity.y = JUMP_VELOCITY
	elif Input.is_action_just_released(up):
		if velocity.y < -100:
			velocity.y = -100
			#velocity.y = move_toward(velocity.y, -100, SPEED * delta)

	# Get the input direction and handle the movement/deceleration.
	# Also lerp the movment to 0 so it slows down
	var direction = Input.get_axis(left, right)
	if direction:
		velocity.x += (direction * SPEED * delta )
	else:
		velocity.x -= (direction * SPEED * delta)

func _physics_process(delta):
	velocity.y += gravity * delta
	velocity.x = lerp(velocity.x, 0.0, FRICTION)
	
	player_controls(up_key, left_key, right_key, delta)
	#player_controls("move_up_player1", "move_left_player1", "move_right_player1", delta)
	
	move_and_slide()
