extends Timer

var Wall = load("res://Scenes/Wall.tscn")
var ScorePoint = load("res://Scenes/ScorePoint.tscn")

const INITIAL_WALL_SPEED = 200

const MAX_WALL_SPEED = 600
const MIN_WALL_SPAWN_SPEED = 1

func _ready():
	"""
	seed random number
	"""
	
	randomize()
	generate_random_walls(INITIAL_WALL_SPEED)  # first walls

func generate_random_walls(speed):
	"""
	generate a set of random walls that has a hole for player to pass
	
	Args:
		speed (int): the speed of walls moving towards player
	"""
	
	var hole_size     = randi() % 96 + 96
	var hole_position = randi() % (568 - hole_size) + 32
	
	spawn_walls_in_given_direction(1056, hole_position, speed, -1)
	spawn_walls_in_given_direction(1056, hole_position + hole_size, speed, 1)
	spawn_score_point(1056, hole_position, speed)

func spawn_score_point(x, y, speed):
	"""
	spawn score point at a given position
	
	Args:
		x     (int): the x position of the score point
		y     (int): the y position of score point
		speed (int): the speed of score point moving towards player
	"""
	
	var score_point = ScorePoint.instance()
	
	score_point.position.x = x
	score_point.position.y = y
	score_point.movement   = Vector2(-speed, 0)
	
	add_child(score_point)

func spawn_walls_in_given_direction(x, y, speed, up):
	"""
	spawn walls above/below a given position
	
	Args:
		x     (int): the x position of the wall
		y     (int): spawn walls above/below the y position
		speed (int): the speed of wall moving towards player
		up    (int): if -1, spawn walls above x, otherwize spawn below
	"""
	
	var block_size = 64 * up
	
	var y_pos = y + block_size / 2
	
	while y_pos > -64 and y_pos < 664:
		spawn_wall(x, y_pos, speed)
		y_pos += block_size

func spawn_wall(x, y, speed):
	"""
	spawn a wall with position and speed
	
	Args:
		x     (int): the x position of the wall
		y     (int): the y position of the wall
		speed (int): the speed of wall moving towards player
	"""
	
	var wall = Wall.instance()
	
	wall.position.x = x
	wall.position.y = y
	wall.movement   = Vector2(-speed, 0)
	
	add_child(wall)


func _on_WallGenerator_timeout():
	"""
	every few seconds, generate walls
	"""
	
	var current_score = get_node("/root/Main").score
	
	set_wait_time(max(MIN_WALL_SPAWN_SPEED, 4 - current_score * 0.2))
	
	generate_random_walls(min(MAX_WALL_SPEED, INITIAL_WALL_SPEED + current_score * 20))
