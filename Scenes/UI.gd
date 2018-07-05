extends Control

func _ready():
	"""
	hide game over ui
	"""
	
	$DarkBackground.hide()
	$BodyContainer/ControlHints.hide()

func _process(delta):
	"""
	show score and handle reload
	"""
	
	if Input.is_action_just_pressed("reload"):
		get_tree().reload_current_scene()
	
	show_score()

func game_over():
	"""
	handle game over event
	"""
	
	$DarkBackground.show()
	$BodyContainer/ControlHints.show()

func show_score():
	"""
	show score on screen
	"""
	
	var score = get_node("/root/Main").score
	
	$TitleContainer/ScoreLable.set_text("Score: " + str(score))
