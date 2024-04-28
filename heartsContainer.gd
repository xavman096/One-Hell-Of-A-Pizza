extends HBoxContainer

@onready var HeartGuiClass = preload("res://heart.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

# adds a heart to the container/gui for each heart.
func setMaxHearts(max : int):
	for i in range(max):
		var heart = HeartGuiClass.instantiate()
		add_child(heart)

# updates hearts to be either full or empty based on current health.
func updateHearts(currentHealth: int):
	var hearts = get_children()
	
	for i in range(currentHealth):
		hearts[i].update(true)
	
	for i in range(currentHealth, hearts.size()):
		hearts[i].update(false)
