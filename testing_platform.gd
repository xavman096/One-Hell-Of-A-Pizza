extends Node2D

@onready var heartsContainer = $CanvasLayer/heartsContainer
@onready var player1 = $playertest


# Called when the node enters the scene tree for the first time.
func _ready():
	heartsContainer.setMaxHearts(player1.maxHealth)
	heartsContainer.updateHearts(player1.currentHealth)
	player1.healthChanged.connect(heartsContainer.updateHearts)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
