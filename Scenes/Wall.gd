extends Area2D

var movement = Vector2(0, 0)

func _physics_process(delta):
	"""
	move wall towards player
	"""
	
	set_position(get_position() + movement * delta)

func _on_VisibilityNotifier2D_screen_exited():
	"""
	when wall goes out of screen, remove instance
	"""
	
	queue_free()

func _on_Wall_body_entered(body):
	"""
	when chicken enter the area, end the game
	"""
	
	get_node("/root/Main").gameover_handle()
