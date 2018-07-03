extends Timer

var Wall = load("res://Scenes/Wall.tscn")

func _ready():
	"""
	seed random number
	"""
	
	randomize()
	generate_random_walls(200)  # first walls

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
	
	generate_random_walls(200)
