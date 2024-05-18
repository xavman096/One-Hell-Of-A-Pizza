extends "res://collectables/collectable.gd"

@export var item: InvItem

# calls the player pickup function.
func collect(player: Node):
	player.pickup(item)
	super(player)
