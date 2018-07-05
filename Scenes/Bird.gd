extends KinematicBody2D

# bird stat constant
const GRAVITY = 17
const FLY_HEIGHT = 300

# bird movement
var movement = Vector2()

# bird sprite
onready var sprite = get_node("AnimatedSprite")

func _physics_process(delta):
	"""
	handle all bird action frame by frame
	"""
	
	# handle flying sprite animation
	sprite_handler()
	
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
		
		# add a down frame to create flying animation
		sprite.play("down")

func sprite_handler():
	"""
	handle flying sprite animation
	"""
	
	sprite.play("up") if movement.y < 0 else sprite.play("down")

func _on_VisibilityNotifier2D_screen_exited():
	"""
	when chicken flies out of screen, end the game
	"""
	
	get_node("/root/Main").gameover_handle()
