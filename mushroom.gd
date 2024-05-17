extends "res://collectable.gd"

@export var healthBoost: int = 1

# gains health for the player when mushroom is collected.
func collect(player: Node):
	if player.currentHealth < player.maxHealth:
		player.gainHealth(healthBoost)
	super(player)
