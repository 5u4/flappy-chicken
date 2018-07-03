extends KinematicBody2D

# bird stat constant
const GRAVITY = 15
const FLY_HEIGHT = 250

# bird movement
var movement = Vector2()

func _physics_process(delta):
	"""
	handle all bird action frame by frame
	"""
	
	gravity()  # apply gravity to bird
	fly()      # apply fly to bird
	
	# bird movement
	move_and_slide(movement, Vector2(-1, 0))

func gravity():
	"""
	pull bird down by a force
	"""
	
	movement.y += GRAVITY

func fly():
	"""
	when up is pressed, stop bird dropping and raise it up
	"""
	
	if Input.is_action_just_pressed("ui_up"):
		# stop bird dropping
		movement.y = 0
		
		# move it up
		movement.y -= FLY_HEIGHT
