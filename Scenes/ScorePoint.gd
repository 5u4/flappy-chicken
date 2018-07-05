extends Area2D

var movement = Vector2(0, 0)

func _physics_process(delta):
	"""
	move score point towards player
	"""
	
	set_position(get_position() + movement * delta)

func _on_ScorePoint_body_exited(body):
	"""
	when player leaves the score point, earn score
	"""
	
	get_node("/root/Main").earn_score()
