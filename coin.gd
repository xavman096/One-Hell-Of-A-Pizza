extends "res://collectable.gd"

# floating up effect for coin.
func collect(player: Node):
	var tween = create_tween()
	tween.tween_property(self, "position", position + Vector2(0, -20), 0.5)
	tween.tween_property(self, "modulate:a", 0.0, 0.5)
	# need to fix this as you can reenter the hitbox and gain 2 coins etc.
	tween.tween_callback(self.queue_free)
	
	Global.coins += 1
