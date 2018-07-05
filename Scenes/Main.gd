extends Node

var score = 0

func gameover_handle():
	"""
	handle game over event
	"""
	
	# pause the game
	get_tree().paused = true

func earn_score():
	"""
	earn a score
	"""
	
	score += 1
