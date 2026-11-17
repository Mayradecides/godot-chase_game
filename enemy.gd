extends CharacterBody2D

@export var speed: float = 230.0
@export var target: Node2D

func _ready() -> void:
	if target == null:
		target = get_tree().current_scene.find_child("Player", true, false)
	
	# Give each thief a slightly different speed (between 200 and 260)
	# so they naturally separate into a pack without ever backing away
	speed += randf_range(-30.0, 30.0)

func _physics_process(_delta: float) -> void:
	if target == null:
		return
	
	# Point directly from the thief to the player and run straight at them
	var direction: Vector2 = global_position.direction_to(target.global_position)
	velocity = direction * speed
	move_and_slide()

func _on_catcharea_body_entered(body: Node2D) -> void:
	if body == target:
		get_tree().current_scene.trigger_game_over()
