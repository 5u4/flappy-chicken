extends Node

func gameover_handle():
	"""
	handle game over event
	"""
	
	# pause the game
	get_tree().paused = true
