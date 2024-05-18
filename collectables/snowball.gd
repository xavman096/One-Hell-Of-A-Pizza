extends "res://collectables/collectable.gd"

@export var item: InvItem

func collect(player: Node):
	player.pickup(item)
	super(player)
