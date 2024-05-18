extends "res://collectables/collectable.gd"

# variable to fix the issue where coin can be collected twice.
var is_collected = false


func collect(player: Node):
	
	if is_collected:
		return
	
	is_collected = true
	
	# not sure if necessary to stop double collection
	# but seems likes a good idea regardless.
	$CollisionShape2D.disabled = true
	
	# floating up effect for coin.
	var tween = create_tween()
	tween.tween_property(self, "position", position + Vector2(0, -20), 0.5)
	tween.tween_property(self, "modulate:a", 0.0, 0.5)
	
	tween.tween_callback(self.queue_free)
	
	Global.coins += 1
