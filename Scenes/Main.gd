extends Node

var score = 0

func _process(delta):
	"""
	reload game when reload button is pressed
	"""
	
	if Input.is_action_just_pressed("reload"):
		get_tree().reload_current_scene()

func _ready():
	"""
	when start set pause to false
	"""
	
	get_tree().set_pause(false)

func gameover_handle():
	"""
	handle game over event
	"""
	
	get_tree().set_pause(true)
	$UI.game_over()

func earn_score():
	"""
	earn a score
	"""
	
	score += 1
