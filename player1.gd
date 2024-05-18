extends CharacterBody2D

signal healthChanged

const SPEED = 300.0
const JUMP_VELOCITY = -400.0

@export var maxHealth = 5
@onready var currentHealth: int = maxHealth
@export var inv: Inv


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# default player gravity.
func _physics_process(delta):

	if not is_on_floor():
		velocity.y += gravity * delta


	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	
	var direction = Input.get_axis("Left", "Right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


# function to call to gain health.
func gainHealth(healthBoost):
	currentHealth += healthBoost
	healthChanged.emit(currentHealth)

# changes health if player is hit, returning to menu once zero.
# collection of items.
func _on_player_hurt_area_entered(area):
	if area.name == "PlayerHit":
		currentHealth -= 1
		if currentHealth <= 0:
			get_tree().change_scene_to_file("res://menu.tscn")
		healthChanged.emit(currentHealth)
	if area.has_method("collect"):
		area.collect(self)

# adds item that is picked up.
func pickup(item):
	inv.insert(item)
