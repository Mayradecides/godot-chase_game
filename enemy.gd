extends CharacterBody2D

@export var base_speed: float = 240.0
@export var max_chase_speed: float = 340.0
@export var target: Node2D

func _physics_process(_delta: float) -> void:
	if target == null:
		return
	
	var distance := global_position.distance_to(target.global_position)
	var direction := global_position.direction_to(target.global_position)
	
	# Scale speed based on distance: the farther you are, the faster it sprints to catch up
	var current_speed := clampf(base_speed + (distance * 0.25), base_speed, max_chase_speed)
	
	velocity = direction * current_speed
	move_and_slide()

func _on_catcharea_body_entered(body: Node2D) -> void:
	if body == target:
		get_tree().current_scene.trigger_game_over()
