extends Area2D

# gets rid of item once collected
func collect(player: Node):
	queue_free()
