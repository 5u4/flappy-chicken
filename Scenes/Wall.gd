extends Area2D

var movement = Vector2(0, 0)

func _physics_process(delta):
	set_position(get_position() + movement * delta)
